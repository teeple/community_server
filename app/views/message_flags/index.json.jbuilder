json.array!(@message_flags) do |message_flag|
  json.extract! message_flag, :id, :message_id, :user_id
  json.url message_flag_url(message_flag, format: :json)
end
