# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventReminderJob, type: :job do
  include ActiveJob::TestHelper
  fixtures :events

  before do
    @event = events(:second_user_event1)
  end

  describe 'schedules a reminder email' do
    it 'queuing the corresponding job' do
      expect do
        EventReminderJob.perform_later(@event.id, @event.updated_at)
      end.to have_enqueued_job
    end
  end
end
