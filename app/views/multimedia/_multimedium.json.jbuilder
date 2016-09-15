json.extract! multimedium, :id, :name, :description, :url, :created_at, :updated_at
json.url multimedium_url(multimedium, format: :json)