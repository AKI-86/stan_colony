class AddIsActiveToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :is_active, :boolean, null: false, default: true
  end
end
