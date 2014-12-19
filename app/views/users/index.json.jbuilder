json.array!(@users) do |user|
  json.extract! user, :id, :mobile, :password, :status
  json.url user_url(user, format: :json)
end
