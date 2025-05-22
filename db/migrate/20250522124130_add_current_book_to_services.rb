class AddCurrentBookToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :current_book, :string
  end
end
