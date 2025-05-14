class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      # t.references :topic_genre, null: false, foreign_key: true

      t.string :title, null: false
      t.text :body, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end

    add_index :topics, :title, unique: true
  end
end
