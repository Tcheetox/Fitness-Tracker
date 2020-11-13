module ApplicationHelper
  def awesome(c, f = '')
    content_tag(:em, '', class: c, data: f)
  end
end
