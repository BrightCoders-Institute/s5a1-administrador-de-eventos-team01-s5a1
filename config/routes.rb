# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'events#index'

  get '/events', to: 'events#index', as: 'events'
  post '/events', to: 'events#create'
  get '/event/new', to: 'events#new', as: 'new_event'
  get '/event/:id', to: 'events#show', as: 'event'
  get '/event/:id/edit', to: 'events#edit', as: 'edit_event'
  put '/event/:id', to: 'events#update'
  patch '/event/:id', to: 'events#update'
  delete '/event/:id', to: 'events#destroy'
end
