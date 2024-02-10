# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventMailer, type: :mailer do
  fixtures :events

  before do
    @event = events(:second_user_event1)
    @email = described_class.with(event: @event).event_notification
  end

  describe 'creates and sends notification email' do
    it 'with valid headers' do
      expect(@email.subject).to eq("Event no. #{@event.id} Reminder")
      expect(@email.to).to eq([@event.user.email])
      expect(@email.from).to eq(['brighteventsexample@outlook.com'])
    end

    it 'with valid email queuing' do
      expect do
        perform_enqueued_jobs do
          described_class.with(event: @event).event_notification.deliver_later
        end
      end.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
