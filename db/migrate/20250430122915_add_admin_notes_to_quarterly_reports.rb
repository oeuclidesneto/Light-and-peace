class AddAdminNotesToQuarterlyReports < ActiveRecord::Migration[7.0]
  def change
    add_column :quarterly_reports, :admin_notes, :text
  end
end
