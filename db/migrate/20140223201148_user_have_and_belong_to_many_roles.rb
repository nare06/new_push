class UserHaveAndBelongToManyRoles < ActiveRecord::Migration
  def self.up
  create_table :roles_users, :id => false do |t|
    t.belongs_to :role
    t.belongs_to :user
    end
    add_index :roles_users, ["role_id", "user_id"], :unique => true
  end
  def self.down
    drop_table :roles_users
    end
end
