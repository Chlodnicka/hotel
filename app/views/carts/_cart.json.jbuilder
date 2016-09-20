json.extract! cart, :id, :ip_address, :created_at, :updated_at
json.url cart_url(cart, format: :json)