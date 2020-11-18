module ApplicationHelper
  def awesome(c, f = '')
    content_tag(:em, '', class: c, data: f)
  end

  def is_numeric(obj)
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  def error_class(resource, field)
    !resource.errors.messages[field].blank? ? "is-invalid" : ""
  end
end
