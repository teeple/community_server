json.array!(@sms_notifications) do |sms_notification|
  json.extract! sms_notification, :id, :receiver_user_id, :sms_message, :receiver_phone_no, :event_type, :sent_at, :status, :error_reason
  json.url sms_notification_url(sms_notification, format: :json)
end
