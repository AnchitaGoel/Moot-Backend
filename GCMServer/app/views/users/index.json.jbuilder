json.array!(@users) do |user|
  json.extract! user, :id, :username, :interests, :emailId, :password
  json.url user_url(user, format: :json)
end
