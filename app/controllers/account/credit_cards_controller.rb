class Account::CreditCardsController < Account::AccountController
  expose(:credit_card)

  def new
  end

  def create
    credit_card.attributes = credit_card_params

    if credit_card.save(current_user)
      redirect_to account_plans_path
    else
      render :new
    end
  end

  private

  def credit_card_params
    params.require(:credit_card).permit(
      :name_on_card, :number, :month, :year, :cvv
    )
  end
end