class CreateSpeeches < ActiveRecord::Migration[7.0]
  def change
    create_table :speeches do |t|
      t.string :theme
      t.string :speaker
      t.datetime :date

      t.timestamps
    end
  end
end
