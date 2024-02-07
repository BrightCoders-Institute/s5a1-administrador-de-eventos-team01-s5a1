# frozen_string_literal: true

require 'rails_helper'
require './spec/helpers/event_helpers'

RSpec.describe Event, type: :model do
  include EventHelpers
  fixtures :users, :events

  before do
    @today = Time.current
    @tomorrow = @today + 1.days
    @two_days_from_tomorrow = @tomorrow + 2.days
    @event = events(:first_user_event1)
    @first_user = users(:first_user)
    @second_user = users(:second_user)
  end

  describe 'model data' do
    it 'valid? returns false when Event has empty title' do
      update_test_model_attribute('title', nil)
      test_event_conditions(@event.valid?, false)
    end

    it 'valid? returns false when Event has empty description' do
      update_test_model_attribute('description', nil)
      test_event_conditions(@event.valid?, false)
    end

    it 'valid? returns false when Event has empty date' do
      update_test_model_attribute('date', nil)
      test_event_conditions(@event.valid?, false)
    end

    it 'valid? returns false when Event has empty location' do
      update_test_model_attribute('location', nil)
      test_event_conditions(@event.valid?, false)
    end

    it 'valid? returns false when Event has empty price' do
      update_test_model_attribute('price', nil)
      test_event_conditions(@event.valid?, false)
    end

    it 'valid? returns true when Event has empty public' do
      update_test_model_attribute('public', nil)
      test_event_conditions(@event.valid?, false)
    end

    it 'valid? returns true when Event has no empty fields' do
      test_event_conditions(@event.valid?, true)
    end
  end

  describe 'model users queries' do
    it 'all first user events returns 12 records' do
      test_user_query(@first_user)
    end

    it 'all second user events returns 12 records' do
      test_user_query(@second_user)
    end
  end

  describe 'model users private queries' do
    it 'all first user private events returns 2 records' do
      test_user_private_events_query(@first_user)
    end

    it 'all second user private events returns 2 records' do
      test_user_private_events_query(@second_user)
    end

    it 'all private events returns 4 records' do
      test_event_conditions(Event.only_private_events.count, 4)
    end
  end

  describe 'model dates ranges queries' do
    it 'between tomorrow and 2 days ahead returns 7 records' do
      test_dates_range_query(@tomorrow, @two_days_from_tomorrow, 7)
    end

    it 'tomorrow returns 3 records' do
      test_dates_range_query(@tomorrow, @tomorrow, 3)
    end

    it 'today returns 0 records' do
      test_dates_range_query(@today, @today, 0)
    end
  end

  describe 'model complex queries' do
    it 'all first user private events from tomorrow returns 1 record' do
      test_complex_query(@first_user, @tomorrow, @tomorrow)
    end

    it 'all second user private events from tomorrow returns 1 record' do
      test_complex_query(@second_user, @tomorrow, @tomorrow)
    end
  end

  private

  def update_test_model_attribute(attribute, new_value)
    @event[attribute] = new_value
  end
end
