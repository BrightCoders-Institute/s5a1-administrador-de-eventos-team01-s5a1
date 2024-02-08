# frozen_string_literal: true

class EventMailer < ApplicationMailer
  def event_notification
    @event = params[:event]
    mail(to: @event.user.email, subject: "Event no. #{@event.id} Reminder")
  end
end
