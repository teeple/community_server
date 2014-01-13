class AddEventIdToSmsNotification < ActiveRecord::Migration
  def change
    add_column :sms_notifications, :event_id, :integer
  end
end
