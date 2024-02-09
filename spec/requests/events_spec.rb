# frozen_string_literal: true

require 'rails_helper'
require './spec/helpers/event_helpers'

RSpec.describe 'Events', type: :request do
  include EventHelpers
  fixtures :events

  before do
    @event = events(:first_user_event1)
  end

  describe 'EventsController GET index' do
    it 'responds successfully' do
      test_get_request(events_path)
    end
  end

  describe 'EventsController GET show' do
    it 'responds successfully with valid ID and responds with error when invalid ID' do
      test_get_requests_scenarios(event_path(@event), event_path('Invalid'))
    end
  end

  describe 'EventsController GET new' do
    it 'responds successfully' do
      test_get_request(new_event_path)
    end
  end

  describe 'EventsController POST create' do
    it 'responds successfully with valid event' do
      post events_path, params: { event: {
        title: 'New Event',
        description: 'Description',
        date: Time.current,
        location: 'Location',
        price: 10.5
      } }
      expect(response).to have_http_status(302)
    end

    it 'responds with error when invalid ID' do
      post events_path, params: { event: {
        title: nil,
        description: 'Description',
        date: Time.current,
        location: 'Location',
        price: 10.5
      } }
      expect(response).to_not be_successful
    end
  end

  describe 'EventsController GET edit' do
    it 'responds successfully with valid ID and responds with error when invalid ID' do
      test_get_requests_scenarios(edit_event_path(@event), edit_event_path('Invalid'))
    end
  end

  describe 'EventsController PUT update' do
    it 'responds successfully with valid event' do
      put event_path(@event), params: { id: @event.id, event: {
        title: 'New Event',
        description: 'Description',
        date: Time.current,
        location: 'Location',
        price: 10.5
      } }
      expect(response).to have_http_status(302)
    end

    it 'responds with error when invalid event' do
      put event_path(@event), params: { id: @event.id, event: {
        title: nil,
        description: 'Description',
        date: Time.current,
        location: 'Location',
        price: 10.5
      } }
      expect(response).to_not be_successful
    end
  end

  describe 'EventsController DELETE destroy' do
    it 'responds successfully with valid ID and responds with error when invalid ID' do
      test_delete_requests_scenarios(event_path(@event), event_path('Invalid'))
    end
  end

  describe 'EventsController DELETE purge_image' do
    it 'responds successfully with valid ID' do
      test_delete_request(purge_image_event_path(@event))
    end
  end

  describe 'EventsController GET export_events' do
    it 'responds successfully' do
      test_get_request(export_events_events_path)
    end
  end
end
