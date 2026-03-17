class GenerateTripPlanJob < ApplicationJob
  queue_as :default

  def perform(chat_id)
    chat = Chat.find(chat_id)

    message = chat.messages.last

    ai_message = chat.messages.create!(
      role: "assistant",
      content: ""
    )

    ruby_llm_chat = RubyLLM.chat

    ruby_llm_chat.ask(message.content) do |chunk|
      next if chunk.content.blank?

      ai_message.update!(
        content: ai_message.content + chunk.content
      )

      Turbo::StreamsChannel.broadcast_replace_to(
        chat,
        target: "message_#{ai_message.id}",
        partial: "messages/message",
        locals: { message: ai_message }
      )
    end
  end
end
