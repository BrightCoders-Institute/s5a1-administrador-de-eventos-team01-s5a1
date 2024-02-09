# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Events actions routes.
  root 'home#index'
  resources :events do
    member do
      delete :purge_image
    end

    collection do
      get :export_events
    end
  end
end
