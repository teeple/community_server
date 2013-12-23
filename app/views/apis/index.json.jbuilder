json.array!(@apis) do |api|
  json.extract! api, :id, :ip, :imsi, :ecgi
  json.url api_url(api, format: :json)
end
