class CreateGroupComments < ActiveRecord::Migration[6.1]
  def change
    create_table :group_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.text :body, null: false
      t.timestamps
    end
  end
end
