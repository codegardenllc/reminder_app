# == Schema Information
#
# Table name: event_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class EventType < ActiveRecord::Base
  has_many :event_type_plans
  has_many :plans, through: :event_type_plans

  def display_name
    name.humanize.gsub(/sms/i, 'SMS')
  end
end
