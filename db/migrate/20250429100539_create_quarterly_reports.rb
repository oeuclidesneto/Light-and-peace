class CreateQuarterlyReports < ActiveRecord::Migration[7.0]
  def change
    create_table :quarterly_reports do |t|
      t.string :quarter
      t.integer :year
      t.decimal :recyclables
      t.decimal :canteen
      t.decimal :donations

      t.timestamps
    end
  end
end
