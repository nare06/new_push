json.array!(@groups) do |group|
  json.extract! group, :id, :name, :slug, :description, :short_name, :campus_id
  json.url group_url(group, format: :json)
end
