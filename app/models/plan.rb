# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  limit      :integer
#  price      :float
#  created_at :datetime
#  updated_at :datetime
#

class Plan < ActiveRecord::Base
  has_many :event_type_plans
  has_many :event_types, through: :event_type_plans

  def has_email?
    event_types.where(name: :email).any?
  end

  def has_sms?
    event_types.where(name: :sms).any?
  end
end
