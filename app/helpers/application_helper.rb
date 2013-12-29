module ApplicationHelper

  def markdown(text)
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML, { autolink: true, filter_html: true, hard_wrap: true })
    md.render(text).html_safe
  end

end
