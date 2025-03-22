class AddFullDescriptionToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :full_description, :text
  end
end
