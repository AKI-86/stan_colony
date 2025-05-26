class AddMyTasteToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :my_taste, :text
  end
end
