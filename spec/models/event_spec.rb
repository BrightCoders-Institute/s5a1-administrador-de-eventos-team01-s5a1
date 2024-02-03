# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = Event.new(title: 'title', description: 'description',
                       date: Time.current, location: 'location', price: 10.5)
  end

  describe 'Event model data' do
    it 'valid? returns false when Event has empty title' do
      update_test_model_attribute('title', nil)
      expect(@event.valid?).to be false
    end

    it 'valid? returns true when Event has a non empty title' do
      update_test_model_attribute('title', 'Title')
      expect(@event.valid?).to be true
    end

    it 'valid? returns false when Event has empty description' do
      update_test_model_attribute('description', nil)
      expect(@event.valid?).to be false
    end

    it 'valid? returns true when Event has a non empty description' do
      update_test_model_attribute('description', 'Description')
      expect(@event.valid?).to be true
    end

    it 'valid? returns false when Event has empty date' do
      update_test_model_attribute('date', nil)
      expect(@event.valid?).to be false
    end

    it 'valid? returns true when Event has a non empty date' do
      update_test_model_attribute('date', Time.current)
      expect(@event.valid?).to be true
    end

    it 'valid? returns false when Event has empty location' do
      update_test_model_attribute('location', nil)
      expect(@event.valid?).to be false
    end

    it 'valid? returns true when Event has a non empty location' do
      update_test_model_attribute('location', 'Location')
      expect(@event.valid?).to be true
    end

    it 'valid? returns false when Event has empty price' do
      update_test_model_attribute('price', nil)
      expect(@event.valid?).to be false
    end

    it 'valid? returns true when Event has a non empty price' do
      update_test_model_attribute('price', 10.10)
      expect(@event.valid?).to be true
    end

    it 'valid? returns true when Event has no empty fields' do
      @event = Event.new(title: 'title', description: 'description',
                         date: Time.current, location: 'location', price: 10.5)
      expect(@event.valid?).to be true
    end
  end

  private

  def update_test_model_attribute(attribute, new_value)
    @event[attribute] = new_value
  end
end
