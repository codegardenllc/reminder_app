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

require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
