json.array!(@contractors) do |contractor|
  json.extract! contractor, :id, :name, :address
  json.url contractor_url(contractor, format: :json)
end
