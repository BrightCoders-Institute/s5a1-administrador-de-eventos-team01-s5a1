# frozen_string_literal: true

require 'test_helper'

# Inicializando pruebas.
class EventsControllerTest < ActionController::TestCase
  setup do
    @event = event(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test 'should get show' do
    get :show, params: { id: @event.id }
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create event' do
    assert_difference('Event.count') do
      post :create, params: { event: {
                                        title: 'New Event',
                                        description: 'Description',
                                        date: '2024-01-25',
                                        location: 'Location',
                                        price: 10
                                        }
                                    }
end
