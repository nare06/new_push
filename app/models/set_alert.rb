class SetAlert < ActiveRecord::Base

attr_accessible :user_id, :event_id, :fbpush_id, :gcpush_id, :gcpush_htmllink,:fbpush_htmllink
belongs_to :user
belongs_to :event

validates :user_id, :presence => true
validates :event_id, :presence => true

end
