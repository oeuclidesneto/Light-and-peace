class AddIconAndColorToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :icon, :string
    add_column :services, :color, :string
  end
end
