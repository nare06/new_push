class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.belongs_to :campus, index: true
      t.belongs_to :group, index: true
      t.timestamps
    end
  end

def self.down
  drop_table :users
end
end
