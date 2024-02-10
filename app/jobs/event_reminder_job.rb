# frozen_string_literal: true

class EventReminderJob < ApplicationJob
  queue_as :default

  def perform(event_id, event_updated_at)
    event = Event.find(event_id)
    return if event.updated_at != event_updated_at

    EventMailer.with(event:).event_notification.deliver_later
  end
end
