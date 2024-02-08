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

first_user = User.where(username: 'BrightUser').first_or_initialize
first_user.update(email: 'brighteventsexample@outlook.com', password: '123123', password_confirmation: '123123')

second_user = User.where(username: 'SecondUser').first_or_initialize
second_user.update(email: 'erikgomez198755@outlook.com', password: '123123', password_confirmation: '123123')

2.times do |number|
  event = first_user.events.where(title: "BrightEvent no. #{number + 1}").first_or_initialize
  event.update(description: 'Test event', date: Time.current + (number + 1).days,
               location: 'Test location', price: 10, public: false)

  event = second_user.events.where(title: "Event no. #{number + 1}").first_or_initialize
  event.update(description: 'Test event', date: Time.current + (number + 1).days,
               location: 'Test location', price: 10, public: false)
end

10.times do |number|
  event = first_user.events.where(title: "Public BrightEvent no. #{number + 1}").first_or_initialize
  event.update(description: 'Test event', date: Time.current + (number + 1).days,
               location: 'Test location', price: 10, public: true)
end
