# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events', type: :request do
  before do
    @event = Event.where(title: 'FirstEvent').first
  end

  describe 'EventsController GET index' do
    it 'responds successfully' do
      get events_path
      expect(response).to be_successful
    end
  end

  describe 'EventsController GET show' do
    it 'responds successfully with valid ID' do
      get event_path(@event)
      expect(response).to be_successful
    end

    it 'responds with error when invalid ID' do
      get event_path('Invalid')
      expect(response).to_not be_successful
    end
  end

  describe 'EventsController GET new' do
    it 'responds successfully' do
      get new_event_path
      expect(response).to be_successful
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
    it 'responds successfully with valid ID' do
      get edit_event_path(@event)
      expect(response).to be_successful
    end

    it 'responds with error when invalid ID' do
      get edit_event_path('Invalid')
      expect(response).to_not be_successful
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
    it 'responds successfully with valid ID' do
      delete event_path(@event)
      expect(response).to have_http_status(302)
    end

    it 'responds with error when invalid ID' do
      delete event_path('Invalid')
      expect(response).to_not be_successful
    end
  end
end
