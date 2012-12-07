module ApplicationHelper
  def link_to_name obj, method = nil
    if obj
      if method
        link_to obj.send(method), obj rescue nil
      else
        link_to obj.name, obj rescue nil
      end
    end
  end

  def text_to_html text
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)

    @renderer.render(text).html_safe
  end
  
  def clearfix
    content_tag :div, :class => 'clearboth' do
    
    end
  end
end
