json.array!(@activities) do |activity|
  json.extract! activity, :id, :host_id, :status, :name, :visibility, :location, :description
  json.url activity_url(activity, format: :json)
end
