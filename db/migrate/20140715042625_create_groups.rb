class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :short_name
      t.belongs_to :campus, index: true      
    end
  end
end
