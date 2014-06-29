json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :description, :duration, :picture
  json.url plan_url(plan, format: :json)
end
