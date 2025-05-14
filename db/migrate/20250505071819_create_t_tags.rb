class CreateTTags < ActiveRecord::Migration[6.1]
  def change
    create_table :t_tags do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :topic_tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :t_tags, [:topic_id, :topic_tag_id], unique: true
  end
end
