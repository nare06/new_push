class Role < ActiveRecord::Base
  attr_accessible :name, :user_ids
  #has_many :assignments
  has_and_belongs_to_many :users #, :through => :assignments
  
end
