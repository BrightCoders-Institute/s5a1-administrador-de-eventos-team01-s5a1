# frozen_string_literal :true

require "test_helper"

# Initializing tests.
class EventTest < ActiveSupport::TestCase
  setup do
    @event = Event.new(title: "title", description: "description",
                       date: Time.current, location: "location", price: 10.5)
  end

  test "Event valid? with empty title returns false" do
    update_test_model_attribute('title', nil)
    refute @event.valid?
  end

  test "Event valid? with non empty title returns true" do
    update_test_model_attribute('title', 'Title')
    assert @event.valid?
  end

  test "Event valid? with empty description returns false" do
    update_test_model_attribute('description', nil)
    refute @event.valid?
  end

  test "Event valid? with non empty description returns true" do
    update_test_model_attribute('description', 'Description')
    assert @event.valid?
  end

  test "Event valid? with empty date returns false" do
    update_test_model_attribute('date', nil)
    refute @event.valid?
  end

  test "Event valid? with non empty date returns true" do
    update_test_model_attribute('date', Time.current)
    assert @event.valid?
  end

  test "Event valid? with empty location returns false" do
    update_test_model_attribute('location', nil)
    refute @event.valid?
  end

  test "Event valid? with non empty location returns true" do
    update_test_model_attribute('location', 'Location')
    assert @event.valid?
  end

  test "Event valid? with empty price returns false" do
    update_test_model_attribute('price', nil)
    refute @event.valid?
  end

  test "Event valid? with non empty price returns true" do
    update_test_model_attribute('price', 10.10)
    assert @event.valid?
  end

  private

  def update_test_model_attribute(attribute, new_value)
    @event[attribute] = new_value
  end
end
