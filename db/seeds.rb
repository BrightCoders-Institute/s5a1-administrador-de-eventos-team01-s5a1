# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.where(username: 'ErikGmz').first_or_initialize
user.update(email: 'email', password: '123123', password_confirmation: '123123')

event = user.events.where(title: 'Event no. 1').first_or_initialize
event.update(description: 'Test event', date: Time.current, location: 'Test location', price: 10)
