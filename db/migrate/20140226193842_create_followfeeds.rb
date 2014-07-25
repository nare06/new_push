class CreateFollowfeeds < ActiveRecord::Migration
  def change
    create_table :followfeeds do |t|
          t.integer :user_id
      t.integer :event_id
    end
    add_index :followfeeds, ["user_id", "event_id"], :unique => true
  end
end
