class AddSummaryToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :summary, :text
  end
end
