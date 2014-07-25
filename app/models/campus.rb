class Campus < ActiveRecord::Base
  extend FriendlyId
    attr_accessible :name, :short_name, :slug
    friendly_id :short_name, use: :slugged 
    validates :name, presence: true
    validates :short_name, presence: true
	has_many :events
	has_many :users
 	has_many :groups
end
