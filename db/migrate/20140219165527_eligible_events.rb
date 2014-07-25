class EligibleEvents < ActiveRecord::Migration
  def change
    create_table :eligibles_events, :id => false do |t|
      t.integer :eligible_id
      t.integer :event_id
      end
    add_index :eligibles_events, ["eligible_id", "event_id"], :unique => true
  end
end
