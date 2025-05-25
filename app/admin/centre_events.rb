ActiveAdmin.register CentreEvent do
  menu label: "📅 Centre Events", priority: 3

  permit_params :title, :date, :description, :location, :icon

  ICON_OPTIONS = {
    "Calendar" => "fa-solid fa-calendar-days",
    "Hands (Workshop)" => "fa-solid fa-hands-asl-interpreting",
    "Microphone" => "fa-solid fa-microphone",
    "Book" => "fa-solid fa-book",
    "Star & Crescent" => "fa-solid fa-star-and-crescent"
  }

  form do |f|
    f.inputs "Event Details" do
      f.input :title
      f.input :description
      f.input :location
      f.input :icon, input_html: { value: 'fa-solid fa-calendar-days' }

      # Separate date and time fields
      f.input :event_date, as: :string, label: "Date (dd/mm/yyyy)", input_html: { value: f.object.date&.strftime("%d/%m/%Y") }
      f.input :event_time, as: :string, label: "Time (HH:MM)", input_html: { value: f.object.date&.strftime("%H:%M") }
    end
    f.actions
  end

  controller do
    def update
      params[:centre_event][:date] = parse_datetime(params[:centre_event].delete(:event_date), params[:centre_event].delete(:event_time))
      super
    end

    def create
      params[:centre_event][:date] = parse_datetime(params[:centre_event].delete(:event_date), params[:centre_event].delete(:event_time))
      super
    end

    private

    def parse_datetime(date_str, time_str)
      return nil if date_str.blank? || time_str.blank?
      Time.strptime("#{date_str} #{time_str}", "%d/%m/%Y %H:%M")
    rescue
      nil
    end
  end
end
