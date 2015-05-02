class Account::EventsController < Account::AccountController
  before_action :over_limit, only: [:new, :create]
  expose(:events) { current_user.events }

  expose(:event)

  def index
  end

  def show
  end

  def edit
  end

  def update
    event.attributes = event_params
    event.event_type = current_plan.event_types.find_by_id(event.event_type_id)

    if event.save
      redirect_to action: :index
    else
      render :edit
    end
  end

  def new
  end

  def create
    event.attributes = event_params
    event.event_type = current_plan.event_types.find_by_id(event.event_type_id)

    if event.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    event.destroy
    redirect_to action: :index
  end

  private

  def event_params
    params.require(:event).permit(:time, :text, :event_type_id)
  end

  def over_limit
    if current_user.over_limit?
      redirect_to account_events_path, alert: 'Oops! You are over your limit.'
      return false
    else
      return true
    end
  end
end