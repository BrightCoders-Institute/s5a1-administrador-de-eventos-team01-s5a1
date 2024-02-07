# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  has_one_attached :image do |attachable|
    attachable.variant :preview, resize_to_limit: [200, 200]
  end

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :image, size: { less_than: 10.megabytes }, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  scope :all_user_events, lambda { |author_id|
    where('user_id = ?', author_id).or(where(public: true)).order(date: :desc, updated_at: :desc)
  }
  scope :only_private_events, -> { where(public: false) }
  scope :events_between_dates, ->(start_date, end_date) { where(date: start_date..end_date) }

  def image_is_saved_and_exists?
    image_blob = image.blob
    image.attached? && image_blob.present? && image_blob.persisted?
  end

  #  def self.to_csv(records)
  #    attributes = Event.attribute_names

  #    CSV.generate(headers: true) do |csv|
  #      csv << attributes

  #      Array(records).each do |event|
  #        csv << attributes.map { |attr| event.send(attr) }
  #      end
  #    end
  #  end

  def self.to_csv(records)
    CSV.generate(headers: true) do |csv|
      csv << %w[id title description location price date]

      Array(records).each do |event|
        csv << [event.id, event.title, event.description, event.location, event.price, event.date]
      end
    end
  end

  # def self.to_csv
  #  CSV.generate(headers: true) do |csv|
  #    csv << %w[id title description location price date] # Agrega las columnas que deseas exportar
  #
  #    all.each do |event|
  #      csv << attributes.map { |attr| event.send(attr) } # Ajusta las columnas según tu modelo
  #    end
  #  end
  # end
end
