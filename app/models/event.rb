# frozen_string_literal: true

# Event model class to manage all the
# events data (validations and relationships).
class Event < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :image, size: { less_than: 10.megabytes }, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  def image_exists?
    image.attached? && image.blob.present? && image.blob.persisted?
  end
end
