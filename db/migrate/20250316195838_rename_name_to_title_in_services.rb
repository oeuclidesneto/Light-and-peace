class RenameNameToTitleInServices < ActiveRecord::Migration[7.0]
  def change
    rename_column :services, :name, :title
  end
end
