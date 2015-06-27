# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean
#  name                   :string(255)
#  email                  :string(255)
#  password               :string(255)
#  number                 :string(255)
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
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_many :events

  validates :plan, presence: true

  # @!group Callbacks
  
  before_validation do
    self.plan ||= Plan.find_by_name(:free)
  end

  def credit_cards
    []
  end

  # This method determines whether the user is over the plan limit.
  #
  # @return [Boolean]
  def over_limit?
    self.plan.limit.to_i > 0 && self.sms_usage >= self.plan.limit
  end

  def switch_plan(plan)
    transaction do
      # charge the user
      self.update_attributes plan: plan
    end
  end
end
