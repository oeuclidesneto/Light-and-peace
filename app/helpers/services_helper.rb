module ServicesHelper
  def formatted_service_description(service)
    simple_format(service.full_description.presence || service.description)
  end
end
