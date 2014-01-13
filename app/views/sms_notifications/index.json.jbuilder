json.array!(@sms_notifications) do |sms_notification|
  json.extract! sms_notification, :id, :receiver_user_id, :integer, :sms_message, :text, :receiver_phone_no, :string, :event_type, :string, :sent_at, :datetime, :status, :string, :error_reason
  json.url sms_notification_url(sms_notification, format: :json)
end
