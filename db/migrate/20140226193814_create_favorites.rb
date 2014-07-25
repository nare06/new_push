class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
          t.integer :user_id
      t.integer :event_id
    end
    add_index :favorites, ["user_id", "event_id"], :unique => true
  end
end
