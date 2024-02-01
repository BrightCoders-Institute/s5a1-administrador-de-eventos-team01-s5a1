# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 100.times do |number|
#   event = Event.where(title: "Event no. #{number + 1}").first_or_initialize
#   event.update(description: 'Test event', date: Time.current, location: 'Test location', price: 10)
# end
