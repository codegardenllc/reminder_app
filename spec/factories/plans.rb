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

FactoryGirl.define do
  factory :plan do
    name { Faker::Name.name }
    price { rand(20) + 5 }
    limit { rand(1000) + 10 }
  end
end
