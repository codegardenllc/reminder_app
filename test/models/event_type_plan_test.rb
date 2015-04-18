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

require 'test_helper'

class EventTypePlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
