json.array!(@relations) do |relation|
  json.extract! relation, :id, :user_from, :user_to, :event_entry, :event_exit, :event_post
  json.url relation_url(relation, format: :json)
end
