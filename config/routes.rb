# frozen_string_literal: true

Rails.application.routes.draw do
  # Events actions routes.
  root 'events#index'
  resources :events
end
