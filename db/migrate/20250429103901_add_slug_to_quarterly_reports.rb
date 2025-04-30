class AddSlugToQuarterlyReports < ActiveRecord::Migration[7.0]
  def change
    add_column :quarterly_reports, :slug, :string
    add_index :quarterly_reports, :slug, unique: true
  end
end
