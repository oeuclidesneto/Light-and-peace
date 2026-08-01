class ChangeCentreEventDateToDatetime < ActiveRecord::Migration[7.0]
  def up
    change_column :centre_events, :date, :datetime,
                  using: "date::timestamp"
  end

  def down
    change_column :centre_events, :date, :string
  end
end
