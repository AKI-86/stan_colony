class AddReasonCategoryToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :reason_category, :integer, default: 0, null: false
  end
end
