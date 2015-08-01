# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean
#  name                   :string(255)
#  email                  :string(255)
#  password               :string(255)
#  mobile_number          :string(255)
#  plan_id                :integer
#  created_at             :datetime
#  updated_at             :datetime
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  email_usage            :integer          default(0)
#  sms_usage              :integer          default(0)
#  customer_token         :string(255)
#  twilio_number          :string(255)
#

describe User do
  describe "creation" do
    subject { FactoryGirl.build(:user) }

    describe "associations" do
      it { is_expected.to belong_to :plan }
      it { is_expected.to have_many :events }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of :plan }
    end
  end
end
