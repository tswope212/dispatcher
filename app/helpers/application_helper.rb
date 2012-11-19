module ApplicationHelper
  def link_to_name obj
    if obj
      link_to obj.name, obj rescue nil
    end
  end

end
