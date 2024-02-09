# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  has_one_attached :image do |attachable|
    attachable.variant :preview, resize_to_limit: [200, 200]
  end

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :notification_datetime, presence: true
  validate :notification_datetime_is_lower_or_equal_than_date
  validates :location, presence: true
  validates :price, presence: true
  validates :public, inclusion: [true, false]
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

  def public_to_string
    public ? "Yes" : "No"
  end

  def format_notification_datetime
    notification_datetime.strftime("%Y-%m-%d %H:%M:%S")
  end

  def schedule_event?(previous_notification_datetime = nil)
    Time.current < notification_datetime && notification_datetime != previous_notification_datetime
  end

  def self.to_csv(records)
    CSV.generate(headers: true) do |csv|
      csv << %w[id author title description location price date notification public]

      Array(records).each do |event|
        csv << [event.id, event.user.username, event.title, event.description,
                event.location, event.price, event.date, event.format_notification_datetime,
                event.public_to_string]
      end
    end
  end

  private

  def notification_datetime_is_lower_or_equal_than_date
    unless date.in_time_zone.to_datetime.end_of_day >= notification_datetime
      errors.add(:notification_datetime, "must be less than or equal to #{date}")
    end
  end
end
