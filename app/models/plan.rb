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
end
