class CreateAuthorizations < ActiveRecord::Migration
  def self.up
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid, :unique => true
      t.string :token
      t.string :secret
      t.string :username
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
  def self.down
    drop_table :authorizations
    end 
end
