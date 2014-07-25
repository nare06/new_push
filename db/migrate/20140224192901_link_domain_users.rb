class LinkDomainUsers < ActiveRecord::Migration
  def change
  create_table :domains_users, :id => false do |t|
      t.integer :domain_id, :null => false
      t.integer :user_id, :null => false
      end
  add_index(:domains_users, ["domain_id", "user_id"], :unique => true)
  end
end
