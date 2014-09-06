class Category < ActiveRecord::Base   #Event ---- Type

   has_and_belongs_to_many :events
   has_and_belongs_to_many :users
   attr_accessible :name, :image_url, :avatar
 
    validates :name, :uniqueness => {:case_sensitive => false}
    has_attached_file :avatar, :styles => { :small => "150x150#" }, 
                         :default_url => "/images/:style/missing.png"
                                                
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar,:size => { :in => 0..500.kilobytes },
  :content_type => { :content_type => ["image/jpg", "image/gif", "image/png","image/jpeg"] }
end
