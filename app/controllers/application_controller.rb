# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |devise|
      devise.permit(:username, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |devise|
      devise.permit(:username, :email, :password, :current_password, :password_confirmation)
    end
  end
end
