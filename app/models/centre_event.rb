class CentreEvent < ApplicationRecord
  # Constants
  ICON_OPTIONS = {
    "Calendar" => "fa-solid fa-calendar-days",
    "Hands (Workshop)" => "fa-solid fa-hands-asl-interpreting",
    "Microphone" => "fa-solid fa-microphone",
    "Book" => "fa-solid fa-book",
    "Star & Crescent" => "fa-solid fa-star-and-crescent"
  }.freeze

  # Validations
  validates :title, :description, :location, :date, :icon, presence: true
  validates :icon, inclusion: { in: ICON_OPTIONS.values }

  validates :registration_url,
            format: {
              with: /\Ahttps?:\/\/.+\z/i,
              message: "must start with http:// or https://"
            },
            allow_blank: true

  # Ransack searchable attributes (for ActiveAdmin)
  def self.ransackable_attributes(_auth_object = nil)
    %w[
      title
      date
      description
      location
      icon
      registration_url
      created_at
      updated_at
    ]
  end

  # Optional: Format date for better display
  def formatted_date
    date&.strftime("%B %d, %Y at %H:%M")
  end
end
