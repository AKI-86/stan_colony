class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :introduction
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
    add_index :artists, :name, unique: true
  end
end

