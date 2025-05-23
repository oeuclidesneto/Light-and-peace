module ServicesHelper
  def formatted_service_description(service)
    if service.full_description.present?
      service.full_description.html_safe
    else
      simple_format(service.description)
    end
  end
end
