# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  event_type_id :integer
#  completed     :boolean          default(FALSE)
#  text          :string(255)
#  time          :datetime
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :user

  validates :event_type, presence: true
  validates :user, presence: true
  validates :text, presence: true
  validates :time, presence: true
end
