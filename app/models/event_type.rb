class EventType < ActiveRecord::Base
  has_many :event_type_plans
  has_many :plans, through: :event_type_plans
end
