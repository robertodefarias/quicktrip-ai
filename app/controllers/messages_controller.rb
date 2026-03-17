class MessagesController < ApplicationController
  before_action :authenticate_user!

  SYSTEM_PROMPT = "Você é um assistente especialista em planejamento de viagens.
    Responda sempre em português.
    Formate todas as respostas usando Markdown válido.

    Regras obrigatórias:
    - Use ## para títulos principais
    - Use ### para subtítulos
    - Use listas com '-'
    - Use parágrafos curtos

    Quando criar roteiros:
    - Separe por dias
    - Organize em Manhã / Tarde / Noite
    - Use listas para atividades

    Evite textos longos em bloco.
    Exemplo de resposta:

    ## Roteiro de 1 dia - Paris

    ### Manhã
    - Torre Eiffel
    - Café da manhã em Montmartre"

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @trip = @chat.trip

    @message = @chat.messages.create!(
      role: "user",
      content: params[:message][:content]
    )

    @ai_message = @chat.messages.create!(
      role: "assistant",
      content: ""
    )

    # dispara o streaming depois
    send_question

    head :ok
  end

  private

  def send_question(model: "gpt-4o-mini", with: {})
    ruby_llm_chat = RubyLLM.chat

    ruby_llm_chat.with_instructions(instructions)

    build_conversation_history(ruby_llm_chat)

    buffer = ""
    first_chunk = true

    ruby_llm_chat.ask(@message.content, with: with) do |chunk|
      next if chunk.content.blank?

      # primeiro token aparece imediatamente
      if first_chunk
        @ai_message.content += chunk.content
        broadcast_replace(@ai_message)
        first_chunk = false
        next
      end

      buffer += chunk.content

      # envia a cada ~25 caracteres
      if buffer.length > 10
        @ai_message.content += buffer
        buffer = ""

        broadcast_replace(@ai_message)
      end
    end

    # envia resto do buffer
    unless buffer.empty?
      @ai_message.content += buffer
      broadcast_replace(@ai_message)
    end

    # salva no banco apenas uma vez
    @ai_message.save!
  end


  # monta o histórico da conversa
  def build_conversation_history(chat_llm)
    @chat.messages.last(8).each do |message|
      next if message.content.blank?
      next if message == @message
      chat_llm.add_message(
        role: message.role,
        content: message.content
      )
    end
  end


  # envia atualização via ActionCable
  def broadcast_replace(message)
    Turbo::StreamsChannel.broadcast_replace_to(
      @chat,
      target: helpers.dom_id(message),
      partial: "messages/message",
      locals: { message: message }
    )
  end


  # contexto da viagem
  def trip_context
    "The user is planning a trip to #{@trip.city}. #{@trip.content}"
  end


  # instruções para o modelo
  def instructions
    [SYSTEM_PROMPT, trip_context].compact.join("\n\n")
  end

end
