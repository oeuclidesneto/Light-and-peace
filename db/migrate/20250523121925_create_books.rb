class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.integer :position
      t.boolean :current

      t.timestamps
    end
  end
end
