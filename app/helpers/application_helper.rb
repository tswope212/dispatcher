module ApplicationHelper
  def link_to_name obj
    if obj
      link_to obj.name, obj rescue nil
    end
  end


  def text_to_html text
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)

    @renderer.render(text).html_safe
  end
end
