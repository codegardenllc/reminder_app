class Account::AccountController < ApplicationController
  before_action :authenticate_user!

  expose(:current_plan) { current_user.plan }
end