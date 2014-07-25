class CreateEvents < ActiveRecord::Migration
  def self.up
      create_table :events do |t|
      t.string :title
      t.string :organizer
      t.string :location
      t.datetime :sdatetime
      t.datetime :edatetime
      t.string :contact_name
      t.string :contact_phone
      t.string :email
      t.text   :events_description
      t.string :short_description
      t.string :venue
      t.string :web      
      t.belongs_to :user, index: true
      t.belongs_to :campus, index: true
      t.belongs_to :group, index: true      
      t.belongs_to :reach, index: true
      t.timestamps

    end
  end
  def self.down
    drop_table :events
    end
end
