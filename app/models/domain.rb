class Domain < ActiveRecord::Base #Event --- topic
has_and_belongs_to_many :events
has_and_belongs_to_many :users
has_and_belongs_to_many :groups
attr_accessible :name
 rails_admin do 
  edit do
      field :name 
      end 
    end
    validates :name, :uniqueness => {:case_sensitive => false}
end
