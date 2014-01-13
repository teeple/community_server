class CreateSmsNotifications < ActiveRecord::Migration
  def change
    create_table :sms_notifications do |t|
      t.string :receiver_user_id
      t.string :integer
      t.string :sms_message
      t.string :text
      t.string :receiver_phone_no
      t.string :string
      t.string :event_type
      t.string :string
      t.string :sent_at
      t.string :datetime
      t.string :status
      t.string :string
      t.text :error_reason

      t.timestamps
    end
  end
end
