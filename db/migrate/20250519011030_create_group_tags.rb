class CreateGroupTags < ActiveRecord::Migration[6.1]
  def change
    create_table :group_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :group_tags, :name, unique: true
  end
end
