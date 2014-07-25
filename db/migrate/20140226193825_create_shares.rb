class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :user_id
      t.integer :event_id
    end
  add_index :shares, ["user_id", "event_id"], :unique => true
  end
end
