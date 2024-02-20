# frozen_string_literal: true

module EventHelpers
  def test_complex_query(user, start_date, end_date)
    test_event_conditions(Event.all_private_user_events_between_dates(user.id, start_date,
                                                                      end_date).count, 1)
  end

  def test_dates_range_query(start_date, end_date, expected_value)
    test_event_conditions(Event.events_between_dates(start_date, end_date).count, expected_value)
  end

  def test_user_private_events_query(user)
    test_event_conditions(Event.all_user_events(user.id).only_private_events.count, 5)
  end

  def test_user_query(user)
    test_event_conditions(Event.all_user_events(user.id).count, 25)
  end

  def test_schedule_event_scenario(test_datetime, expected_value)
    update_test_model_attribute('notification_datetime', test_datetime)
    test_event_conditions(@event.schedule_event?, expected_value)
  end

  def test_schedule_event_scenario_without_change(test_datetime)
    update_test_model_attribute('notification_datetime', test_datetime)
    test_event_conditions(@event.schedule_event?(test_datetime), false)
  end

  def test_event_conditions(resulting_value, expected_value)
    expect(resulting_value).to be expected_value
  end

  def test_get_requests_scenarios(request_path, invalid_request_path)
    test_get_request(request_path)
    test_invalid_get_request(invalid_request_path)
  end

  def test_get_request(request_path)
    get request_path
    expect(response).to be_successful.or have_http_status(302)
  end

  def test_delete_requests_scenarios(request_path, invalid_request_path)
    test_delete_request(request_path)
    test_invalid_delete_request(invalid_request_path)
  end

  private

  def test_invalid_get_request(request_path)
    get request_path
    expect(response).to_not be_successful
  end

  def test_delete_request(request_path)
    delete request_path
    expect(response).to have_http_status(302)
  end

  def test_invalid_delete_request(request_path)
    delete request_path
    expect(response).to_not be_successful
  end
end

RSpec.configure do |config|
  config.include EventHelpers
end
