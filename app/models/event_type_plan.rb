# == Schema Information
#
# Table name: event_type_plans
#
#  id            :integer          not null, primary key
#  event_type_id :integer
#  plan_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class EventTypePlan < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :plan
end
