json.extract! order, :id, :reservation_id, :ip_address, :email, :card_type, :card_expires_on, :created_at, :updated_at
json.url order_url(order, format: :json)