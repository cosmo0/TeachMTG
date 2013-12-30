module ApplicationHelper

  def markdown(text)
    if text.nil? || text.empty? then return "No description available" end
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML, { autolink: true, filter_html: true, hard_wrap: true })
    md.render(text).html_safe
  end

end
