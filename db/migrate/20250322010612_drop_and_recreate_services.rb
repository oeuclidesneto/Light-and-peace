class DropAndRecreateServices < ActiveRecord::Migration[7.0]
  def change
    drop_table :services, if_exists: true

    create_table :services do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
