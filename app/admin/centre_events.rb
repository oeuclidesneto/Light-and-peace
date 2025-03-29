ActiveAdmin.register CentreEvent do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :date, :description, :location, :icon
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :date, :description, :location, :icon]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
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
      f.input :date
      f.input :location
      f.input :description
      f.input :icon, as: :select, collection: ICON_OPTIONS.invert, include_blank: false
    end
    f.actions
  end
end
