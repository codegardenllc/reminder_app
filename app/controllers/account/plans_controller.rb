class Account::PlansController < Account::AccountController
  before_action :require_credit_card, only: :switch

  expose(:plans)

  expose(:plan)

  def index
  end

  def switch
    if current_user.switch_plan(plan)
      redirect_to account_plans_path, notice: "Switched to the #{plan.name.titleize} plan."
    else
      flash[:alert] = 'Unable to switch plans.'
      redirect_to action: :index
    end
  end

  private

  def require_credit_card
    if plan.price.to_f == 0 || current_user.credit_cards.any?
      true
    else
      redirect_to new_account_credit_card_path, notice: 'Please add a credit card to continue.'
      false
    end
  end
end