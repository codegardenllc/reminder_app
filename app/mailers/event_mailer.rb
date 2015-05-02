class EventMailer < ActionMailer::Base
  default from: "event@reminderapp.com"

  def event_email(event)
    @message = event.text
    mail(to: event.user.email, subject: 'Reminder from ReminderApp')
  end
end
