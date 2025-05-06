class CreateArtistTags < ActiveRecord::Migration[6.1]
  def change
    create_table :artist_tags do |t|
      t.string :name, null: false
      
      t.timestamps
    end
    add_index :artist_tags, :name, unique: true
  end
end
