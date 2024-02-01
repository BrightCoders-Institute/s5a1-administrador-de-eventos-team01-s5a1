# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update purge_image destroy]
  before_action :authenticate_user!

  def index
    @pagy, @events = pagy(Event.all)
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
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    previous_image_exists = @event.image_is_saved_and_exists?
    previous_attachment_blob = @event.image.blob if previous_image_exists

    if @event.update(events_params)
      redirect_to @event
    else
      reattach_image(previous_attachment_blob) if previous_image_exists
      render :edit, status: :unprocessable_entity
    end
  end

  def purge_image
    @event.image.purge
    redirect_to @event
  end

  def destroy
    @event.destroy
    redirect_to root_path
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

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def events_params_without_image
    params.require(:event).except(:image)
  end

  def events_params
    params.require(:event).permit(:title, :description, :date, :location,
                                  :price, :public, :image, :delete_image, :user_id)
  end
end
