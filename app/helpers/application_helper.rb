module ApplicationHelper

  def awesome(c, f = '')
    content_tag(:em, '', class: c, data: f)
  end

  def is_numeric(obj) 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

end
