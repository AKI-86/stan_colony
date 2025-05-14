class CreateGroupMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :group_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.boolean :is_admin_member, default: false
      t.timestamps
    end
    add_index :group_memberships, [:user_id, :group_id], unique: true
  end
end
