class CreateATags < ActiveRecord::Migration[6.1]
  def change
    create_table :a_tags do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :artist_tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :a_tags, [:artist_id, :artist_tag_id], unique: true
  end
end
