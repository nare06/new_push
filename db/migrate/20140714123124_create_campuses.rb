class CreateCampuses < ActiveRecord::Migration
  def change
    create_table :campuses do |t|
      t.string :name
      t.string :short_name
      t.string :slug
      
      t.timestamps
    end
  end
end
