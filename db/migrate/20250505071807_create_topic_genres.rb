class CreateTopicGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :topic_genres do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :topic_genres, :name, unique: true
  end
end
