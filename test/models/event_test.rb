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

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
