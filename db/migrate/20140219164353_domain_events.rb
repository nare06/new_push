class DomainEvents < ActiveRecord::Migration
  def change
   create_table :domains_events, :id => false do |t|
      t.integer :domain_id
      t.integer :event_id
   end
    add_index :domains_events, ["domain_id", "event_id"], :unique => true
  end
end
