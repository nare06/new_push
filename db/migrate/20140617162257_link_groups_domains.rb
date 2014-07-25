class LinkGroupsDomains < ActiveRecord::Migration
  def change
  create_table :domains_groups, :id => false do |t|
      t.integer :domain_id
      t.integer :group_id
      end
  add_index(:domains_groups, [:domain_id, :group_id], :unique => true)
  end
end
