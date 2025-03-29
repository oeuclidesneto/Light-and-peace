class CreateCentreEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :centre_events do |t|
      t.string :title
      t.string :date
      t.text :description
      t.string :location
      t.string :icon

      t.timestamps
    end
  end
end
