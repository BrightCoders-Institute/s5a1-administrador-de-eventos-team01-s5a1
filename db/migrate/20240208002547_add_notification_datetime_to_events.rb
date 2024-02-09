class AddNotificationDatetimeToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :notification_datetime, :datetime
  end
end
