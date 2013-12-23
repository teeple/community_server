json.array!(@messages) do |message|
  json.extract! message, :id, :message, :message_img, :user_id
  json.url message_url(message, format: :json)
end
