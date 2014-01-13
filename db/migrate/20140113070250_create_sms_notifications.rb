class CreateSmsNotifications < ActiveRecord::Migration
  def change
    create_table :sms_notifications do |t|
      t.integer :receiver_user_id
      t.text :sms_message
      t.string :receiver_phone_no
      t.string :event_type
      t.datetime :sent_at
      t.string :status
      t.string :error_reason

      t.timestamps
    end
  end
end
