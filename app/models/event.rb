# frozen_string_literal: true

class Event < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :preview, resize_to_limit: [200, 200]
  end

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :image, size: { less_than: 10.megabytes }, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  def image_is_saved_and_exists?
    image.attached? && image.blob.present? && image.blob.persisted?
  end
end
