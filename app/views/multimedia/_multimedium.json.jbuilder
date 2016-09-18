json.extract! multimedium, :id, :name, :description, :image, :created_at, :updated_at
json.url multimedium_url(multimedium, format: :json)