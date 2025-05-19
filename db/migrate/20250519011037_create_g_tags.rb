class CreateGTags < ActiveRecord::Migration[6.1]
  def change
    create_table :g_tags do |t|
      t.references :group, null: false, foreign_key: true
      t.references :group_tag, null: false, foreign_key: true
      
      t.timestamps
    end
    add_index :g_tags, [:group_id, :group_tag_id], unique: true
  end
end
