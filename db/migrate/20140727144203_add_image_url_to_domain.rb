class AddImageUrlToDomain < ActiveRecord::Migration
  def change
       add_column :domains, :image_url, :string
  end
end
