class AddDeletedToGroupComments < ActiveRecord::Migration[6.1]
  def change
    add_column :group_comments, :deleted, :boolean, default: false
  end
end
