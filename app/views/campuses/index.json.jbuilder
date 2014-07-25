json.array!(@campuses) do |campus|
  json.extract! campus, :name, :short_name, :slug
  json.url campus_url(campus, format: :json)
end
