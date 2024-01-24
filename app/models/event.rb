class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :price, presence: true
end
