class Campus < ActiveRecord::Base
  extend FriendlyId
    attr_accessible :name, :short_name, :slug, :avatar
    friendly_id :short_name, use: :slugged 
    validates :name, presence: true
    validates :short_name, presence: true
    validates_uniqueness_of :short_name
	has_many :events
	has_many :users
 	has_many :groups
 	 has_attached_file :avatar, :styles => { :small => "150x150#" }, 
                         :default_url => "/images/:style/missing.png"
                                                
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar,:size => { :in => 0..500.kilobytes },
  :content_type => { :content_type => ["image/jpg", "image/gif", "image/png","image/jpeg"] }

    scope :search, lambda{|query| where(["lower(name) LIKE ? ","%#{query.downcase}%"])}
end