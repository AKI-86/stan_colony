class ChangeReasonNullOnReports < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reports, :reason, true
  end
end
