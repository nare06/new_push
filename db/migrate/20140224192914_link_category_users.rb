class LinkCategoryUsers < ActiveRecord::Migration
  def change
   create_table :categories_users, :id => false do |t|
      t.integer :category_id
      t.integer :user_id
      end
   add_index(:categories_users, ["category_id", "user_id"], :unique => true)
  end
end
