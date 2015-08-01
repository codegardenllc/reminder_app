class Account::AccountController < ApplicationController
  before_action :authenticate_user!
  before_action :require_mobile_number!

  expose(:current_plan) { current_user.plan }

  private

  def require_mobile_number!
    if current_user.plan.has_sms? && current_user.mobile_number.blank?
      flash[:alert] = 'Please set your mobile number before continuing.'
      redirect_to account_edit_path
      false
    else
      true
    end
  end
end