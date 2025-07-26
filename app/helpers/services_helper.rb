module ServicesHelper
    def service_link_path(service)
    title = service.title.to_s.downcase
    case title
    when /study/ then "/services/study-group"
    when /energy/ then "/services/energy-healing"
    when /children|youth/ then "/services/children-and-youth-group"
    when /fraternal/ then "/services/fraternal-assistance"
    when /gospel/ then "/services/gospel-at-home"
    when /library/ then "/services/library"
    when /lecture/ then "/services/lecture"
    else "/services"
    end
  end
end
