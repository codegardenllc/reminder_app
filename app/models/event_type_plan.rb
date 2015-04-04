class EventTypePlan < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :plan
end
