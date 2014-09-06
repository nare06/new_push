class Group < ActiveRecord::Base
extend FriendlyId
attr_accessible :name, :short_name, :slug, :description, :contact_name, 
                :contact_phone, :email,:campus_id,:avatar,:category_ids =>[]
                
friendly_id :short_name, use: :slugged
validates :name, presence: true
validates :short_name, presence: true
validates :campus, presence: true
has_many :users
has_many :events
has_and_belongs_to_many :categories   #topics
#has_many :microposts, :dependent => :destroy
belongs_to :campus
 has_attached_file :avatar, :styles => { :small => "150x150#" }, 
                         :default_url => "/images/:style/missing.png"
                                                
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar,:size => { :in => 0..500.kilobytes },
  :content_type => { :content_type => ["image/jpg", "image/gif", "image/png","image/jpeg"] }
end
