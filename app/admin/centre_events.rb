ActiveAdmin.register CentreEvent do
  menu label: "📅 Events", priority: 3
  config.comments = false

  permit_params :title,
                :date,
                :description,
                :location,
                :icon,
                :registration_url,
                :event_date,
                :event_time

  ICON_OPTIONS = {
    "Calendar" => "fa-solid fa-calendar-days",
    "Hands (Workshop)" => "fa-solid fa-hands-asl-interpreting",
    "Microphone" => "fa-solid fa-microphone",
    "Book" => "fa-solid fa-book",
    "Star & Crescent" => "fa-solid fa-star-and-crescent"
  }.freeze

  show do
    attributes_table do
      row :title
      row :date
      row :description
      row :location

      row :registration_url do |event|
        if event.registration_url.present?
          link_to event.registration_url,
                  event.registration_url,
                  target: "_blank",
                  rel: "noopener noreferrer"
        else
          status_tag "Not configured", class: "warning"
        end
      end

      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Event Details" do
      f.input :title
      f.input :description
      f.input :location

      f.input :registration_url,
              label: "Registration URL",
              hint: "Optional. Paste the full Google Forms or external registration link, including https://"

      f.input :icon,
              as: :hidden,
              input_html: { value: "fa-solid fa-calendar-days" }

      f.input :event_date,
              as: :string,
              label: "Date",
              input_html: {
                type: "date",
                value: f.object.date&.strftime("%Y-%m-%d")
              }

      f.input :event_time,
              as: :string,
              label: "Time",
              input_html: {
                type: "time",
                value: f.object.date&.strftime("%H:%M"),
                step: 60,
                min: "00:00",
                max: "23:59"
              }
    end

    f.actions
  end

  controller do
    before_action :combine_datetime_params, only: %i[create update]

    private

    def combine_datetime_params
      date = params[:centre_event].delete(:event_date)
      time = params[:centre_event].delete(:event_time)

      params[:centre_event][:date] = parse_datetime(date, time)
      params[:centre_event][:icon] ||= "fa-solid fa-calendar-days"
    end

    def parse_datetime(date_str, time_str)
      return nil if date_str.blank? || time_str.blank?

      DateTime.strptime("#{date_str} #{time_str}", "%Y-%m-%d %H:%M")
    rescue ArgumentError
      nil
    end
  end
end
