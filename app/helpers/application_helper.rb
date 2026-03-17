module ApplicationHelper
  def render_markdown(text)
    return "" if text.blank?

    # corrige headings colados
    text = text.gsub(/(#+)([^\s#])/, '\1 \2')

    # adiciona quebra antes de headings
    text = text.gsub(/(?<!\n)(##)/, "\n\n\\1")

    # corrige listas
    text = text.gsub(/(?<!\n)- /, "\n- ")

    renderer = Redcarpet::Render::HTML.new(
      filter_html: true,
      hard_wrap: true
    )

    markdown = Redcarpet::Markdown.new(
      renderer,
      autolink: true,
      tables: true,
      fenced_code_blocks: true
    )

    markdown.render(text).html_safe
  end
end
