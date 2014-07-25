class AlterPushidsToSetAlertsTable < ActiveRecord::Migration
  def change
   rename_table(:pushids, :set_alerts)
  end
end
