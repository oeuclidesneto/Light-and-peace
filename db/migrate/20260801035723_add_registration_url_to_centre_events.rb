class AddRegistrationUrlToCentreEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :centre_events, :registration_url, :string
  end
end
