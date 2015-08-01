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

class User < ActiveRecord::Base
  # @!group Attributes

  # @!attribute mobile_number
  # The user's cell phone number.
  # @return [String]

  # @!attribute twilio_number
  # The user's account phone number.
  # @return [String]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_many :events

  validates :plan, presence: true

  validate :mobile_number_set

  def mobile_number_set
    if self.plan.try(:has_sms?) && mobile_number.blank?
      self.errors.add(:mobile_number, :blank)
    end

    self.errors.none?
  end

  # @!group Callbacks
  
  before_validation do
    self.plan ||= Plan.find_by_name(:free)
  end

  def customer
    @customer ||= Stripe::Customer.retrieve(customer_token)
  end

  def customer_token
    create_customer if super.blank?
    super
  end

  def create_customer
    self.update_attributes customer_token: Stripe::Customer.create.id
  end

  def credit_cards
    customer.sources
  end

  def subscriptions
    customer.subscriptions
  end

  # This method determines whether the user is over the plan limit.
  #
  # @return [Boolean]
  def over_limit?
    self.plan.limit.to_i > 0 && self.sms_usage >= self.plan.limit
  end

  # This method switches the user's plan and charges the card
  # if necessary.
  #
  # @param [Plan] plan
  #   The plan to switch to.
  #
  # @return [Boolean]
  def switch_plan(plan)
    transaction do
      subscriptions.each do |subscription|
        subscription.delete
      end

      customer.subscriptions.create({plan: plan.name})

      if plan.has_sms?
        if twilio_number.blank?
          numbers = TWILIO_CLIENT.available_phone_numbers.get('US').local.list
          number = numbers.first.try(:phone_number)

          if number
            TWILIO_CLIENT.account.incoming_phone_numbers.create(phone_number: number)
            self.update_attributes twilio_number: number
          else
            return false
          end
        end
      else
        unless twilio_number.blank?
          numbers = TWILIO_CLIENT.account.incoming_phone_numbers.list(phone_number: self.twilio_number)
          numbers.each do |incoming_number|
            incoming_number.delete
          end
        end
      end

      update_attributes plan: plan
    end
  end
end
