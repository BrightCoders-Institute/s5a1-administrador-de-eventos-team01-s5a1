# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Events actions routes.
  root 'home#index'
  resources :events
end
