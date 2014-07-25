class Category < ActiveRecord::Base   #Event ---- Type

   has_and_belongs_to_many :events
   has_and_belongs_to_many :users
   attr_accessible :name, :image_url
   rails_admin do 
  edit do
      field :name 
      end 
    end
    validates :name, :uniqueness => {:case_sensitive => false}
end
