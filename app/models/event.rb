#require 'elasticsearch/model'
class Event < ActiveRecord::Base
#include Elasticsearch::Model
#attr_accessor :upload, :edate, :contact_phone 
before_save :web_check
 extend FriendlyId 
  attr_accessible :title,:organizer,:sdatetime,:edatetime,:contact_name,
                  :contact_phone, :email,:short_description,:events_description,
                  :venue, :user_id, :avatar,:category_ids,:domain_ids, 
                  :eligible_ids,:favorites, :shares, :web, :reach_id,
                  :workflow_state, :slug, :campus_id, :group_id
  friendly_id :title, use: :slugged                               
#----------------------Namescopes----------------------------#
  scope :approved, lambda{ where(:workflow_state => "accept")}
    scope :rejected, lambda{ where(:workflow_state => "reject")}
      #scope :new_events, lambda{ where.not(:workflow_state => "accept" or :workflow_state => "reject")}
      scope :latest, lambda{ order("events.updated_at DESC")}
        scope :search, lambda{|query| where(["lower(title) LIKE ? or lower(venue) LIKE ? or lower(organizer) LIKE ?",
                    "%#{query.downcase}%","%#{query.downcase}%","%#{query.downcase}%"])}
         scope :upcoming, lambda{ where("edatetime > ?", Time.now)}
          scope :expired, lambda{where("edatetime < ?", Time.now)}

#----------------------Validations----------------------------#
validates :title, :presence => true, length: {maximum: 150}
validates_presence_of :sdatetime, :after => Time.now + 45.minutes, :message => ": Check Event Start Date"
validates_presence_of :edatetime, :after => :sdatetime, :message => ": Event End Date should be after start date"
validates_presence_of :organizer,:message => ": who?"
validates :venue, :presence => true
validates_presence_of :reach, :message => "  means Event reach: Campus Event or Hall/Bhavan/Group Events"
validates_presence_of :campus, :message => ": Oops! You missed it!"
validates_presence_of :events_description, :message => "Add more details about the event"
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, format: { with: VALID_EMAIL_REGEX },:allow_blank => true
validates_presence_of :short_description, :length => { :maximum => 140}, :message => "shouldn't be blank"
VALID_PHONE = /([0]|\+91)?[789]\d{9}/
validates_presence_of :web,:allow_blank => true#, :format => URI::regexp(%w(http https)) 
validates :contact_phone,format: { with: VALID_PHONE },:allow_blank => true
has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                                :default_url => "/images/:style/missing.png"
                           

validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
validates_attachment :avatar, :size => { :in => 0..150.kilobytes },
                     :content_type => { :content_type => ["image/jpg", "image/gif", "image/png","image/jpeg"] }
#----------------------End----------------------------#
#----------------------Relationships----------------------------#
#validates :user_id, :presence => true
has_many :set_alerts, :dependent => :destroy
has_many :favorites, :dependent => :destroy
has_many :shares, :dependent => :destroy
has_many :followfeeds, :dependent => :destroy
has_and_belongs_to_many :categories
has_and_belongs_to_many :domains
has_and_belongs_to_many :eligibles
has_many :favorited_by, through: :favorites, source: :user
has_many :shared_by, through: :shares, source: :user
has_many :followfeeds_by, through: :followfeeds, source: :user
belongs_to :user, touch: true
belongs_to :reach, touch: true
belongs_to :campus, touch: true
belongs_to :group, touch: true
#----------------------End----------------------------#
include Workflow
  workflow do
    state :new do
      event :submit, :transitions_to => :being_reviewed
    end
    state :being_reviewed do
      event :accept, :transitions_to => :accepted
      event :reject, :transitions_to => :rejected
    end
    state :accepted
    state :rejected
  end

 private
  def web_check
    self.web = "http://" << self.web if self.web[1..4] != "http" and self.web.present? 
  end
end
