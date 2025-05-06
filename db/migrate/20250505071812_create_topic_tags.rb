class CreateTopicTags < ActiveRecord::Migration[6.1]
  def change
    create_table :topic_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :topic_tags, :name, unique: true
  end
end
