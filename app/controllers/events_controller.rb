# frozen_string_literal: true

require 'csv'

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update purge_image destroy]
  before_action :authenticate_user!

  def index
    @pagy, @events = pagy(filter_events_list)
  rescue Pagy::VariableError
    redirect_to events_path(page: 1)
  end

  def show; end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)

    if @event.save
      if @event.schedule_event?
        EventReminderJob.set(wait_until: @event.notification_datetime).perform_later(@event.id, @event.updated_at)
      end
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    previous_event = @event
    previous_notification_datetime = previous_event.notification_datetime

    if @event.update(events_params)
      if @event.schedule_event?(previous_notification_datetime)
        EventReminderJob.set(wait_until: @event.notification_datetime).perform_later(@event.id, @event.updated_at)
      end
      redirect_to @event
    else
      reattach_image(previous_event.image.blob) if previous_event.image_is_saved_and_exists?
      render :edit, status: :unprocessable_entity
    end
  end

  def purge_image
    @event.image.purge
    redirect_to @event
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def export_events
    respond_to do |format|
      format.csv do
        send_data Event.to_csv(filter_events_list),
                  filename: "BrightCodersEvents_#{Time.now.strftime('%Y%m%d_%H%M%S.')}.csv"
      end
    end
  end

  private

  def reattach_image(previous_attachment_blob)
    generated_errors = @event.errors
    errors_copy = generated_errors.dup
    @event.image.attach(previous_attachment_blob)

    return unless generated_errors.empty?

    save_previous_generated_errors(errors_copy)
  end

  def save_previous_generated_errors(generated_errors)
    generated_errors.each { |error| @event.errors.add(error.attribute, error.type, **error.options) }
  end

  def filter_events_list
    filtered_events = Event.all_user_events(current_user.id)
    filtered_events = filter_private_events(filtered_events)
    filter_events_by_dates_range(filtered_events)
  end

  def filter_private_events(events)
    privates_param = params[:privates]
    return events unless privates_param.present? && privates_param

    events.only_private_events
  end

  def filter_events_by_dates_range(events)
    date_filter_param = params[:date_filter]
    dates_range_param = params[:dates_range]
    return events unless dates_range_param.present? && date_filter_param.present? && date_filter_param

    dates_range = dates_range_param.split(' - ').map { |date| Date.strptime(date, '%Y/%m/%d') }
    events.events_between_dates(dates_range[0], dates_range[1])
  end

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def events_params_without_image
    params.require(:event).except(:image)
  end

  def events_params
    params.require(:event).permit(:title, :description, :date, :notification_datetime, :location,
                                  :price, :public, :image, :delete_image, :user_id)
  end
end
