class Plan < ActiveRecord::Base
  has_many :event_type_plans
  has_many :event_types, through: :event_type_plans
end
