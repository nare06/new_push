class LinkCategoriesGroups < ActiveRecord::Migration
    def change
  	create_table :categories_groups, :id => false do |t|
      t.integer :category_id
      t.integer :group_id
      end
  add_index(:categories_groups, [:category_id, :group_id], :unique => true)
  end
end
