class CategoryEvents < ActiveRecord::Migration
  def change
    create_table :categories_events, :id => false do |t|
      t.integer :category_id
      t.integer :event_id
    end
    add_index :categories_events, ["category_id", "event_id"], :unique => true
  end
end
