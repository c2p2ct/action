json.array!(@users) do |user|
  json.extract! user, :id, :email, :picture, :bio, :twitter, :facebook
  json.url user_url(user, format: :json)
end
