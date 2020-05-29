module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
      when :success then "success" # Green
      when :error then "danger" # Red
      when :recaptcha_error then "danger" # Red
      when :alert then "warning" # Yellow
      when :notice then "info" # Blue
      else flash_type.to_s
    end
  end
end
