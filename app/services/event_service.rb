class EventService
  def self.call
    self.new.call
  end

  def call
    events.each do |event|
      self.send(event)
    end
  end

  def events
    Event.where('completed = ? and time <= ?', false, Time.now.utc)
  end

  def send(event)
    user = event.user

    if user.over_limit?
      return false
    end

    case event.event_type.name.to_sym
    when :email
      EventMailer.event_email(event).deliver
      user.update_attributes email_usage: user.email_usage + 1
    when :sms
      if !(user.twilio_number.blank? || user.mobile_number.blank?)
        TWILIO_CLIENT.account.messages.create(
          from: user.twilio_number,
          to: user.mobile_number,
          body: event.text
        )

        user.update_attributes sms_usage: user.sms_usage + 1
      end
    end

    event.update_attributes completed: true
  end
end