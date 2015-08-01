class Account::SettingsController < Account::AccountController
  skip_before_action :require_mobile_number!, only: [:edit, :update]

  def edit
  end

  def update
    current_user.attributes = user_params

    if current_user.save
      flash[:notice] = 'Settings saved successfully.'
      redirect_to action: :edit
    else
      flash.now[:alert] = 'Unable to save your settings.'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :mobile_number)
  end
end