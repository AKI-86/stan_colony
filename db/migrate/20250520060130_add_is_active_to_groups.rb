class AddIsActiveToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :is_active, :boolean, default: true, null: false
  end
end
