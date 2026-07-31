ActiveAdmin.register Speech do
  menu label: "🎤 Speeches", priority: 4

  config.comments = false
  config.sort_order = "date_asc"

  permit_params :date, :speaker, :theme

  filter :date
  filter :speaker
  filter :theme

  member_action :clear_details, method: :patch do
    resource.update!(
      speaker: nil,
      theme: nil
    )

    redirect_to admin_speech_path(resource),
                notice: "Speech details were cleared. The lecture date was preserved."
  end

  action_item :clear_details, only: :show do
    link_to "Clear details",
            clear_details_admin_speech_path(resource),
            method: :patch,
            data: {
              turbo_confirm: "This will clear the speaker and theme but keep the lecture date. Continue?"
            }
  end

  controller do
    def destroy
      resource.destroy!

      redirect_to admin_speeches_path,
                  notice: "Speech was successfully deleted."
    end
  end

  index do
    selectable_column
    id_column

    column :date do |speech|
      speech.date&.in_time_zone("Adelaide")&.strftime("%d/%m/%Y")
    end

    column :speaker do |speech|
      speech.speaker.presence || "A definir"
    end

    column :theme do |speech|
      speech.theme.presence || "A definir"
    end

    column :created_at

    actions defaults: false do |speech|
      item "View", admin_speech_path(speech)
      text_node " "

      item "Edit", edit_admin_speech_path(speech)
      text_node " "

      item "Delete",
           admin_speech_path(speech),
           method: :delete,
           data: {
             turbo_confirm: "This will permanently delete this lecture date. If the lecture will still take place, use 'Clear details' instead. Continue?"
           }

      text_node " "

      item "Clear details",
           clear_details_admin_speech_path(speech),
           method: :patch,
           data: {
             turbo_confirm: "This will clear the speaker and theme but keep the lecture date. Continue?"
           }
    end
  end

  form do |f|
    f.inputs "Speech Details" do
      f.input :date,
              as: :string,
              label: "Date",
              input_html: {
                type: "date",
                value: f.object.date&.in_time_zone("Adelaide")&.strftime("%Y-%m-%d")
              }

      f.input :speaker
      f.input :theme
    end

    f.actions
  end

  show do
    attributes_table do
      row :id

      row :date do |speech|
        speech.date&.in_time_zone("Adelaide")&.strftime("%d/%m/%Y")
      end

      row :speaker do |speech|
        speech.speaker.presence || "A definir"
      end

      row :theme do |speech|
        speech.theme.presence || "A definir"
      end

      row :created_at
      row :updated_at
    end
  end
end
