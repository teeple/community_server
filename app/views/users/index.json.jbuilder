json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :phone_no, :imsi, :ecgi, :description, :profile_img
  json.url user_url(user, format: :json)
end
