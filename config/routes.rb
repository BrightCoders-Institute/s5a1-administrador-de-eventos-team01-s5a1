# frozen_string_literal: true

Rails.application.routes.draw do
  # Events actions routes.
  root 'home#index'
  resources :events
end
