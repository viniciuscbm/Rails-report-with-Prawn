json.extract! resource, :id, :name, :description, :initial, :deadline, :created_at, :updated_at
json.url resource_url(resource, format: :json)
