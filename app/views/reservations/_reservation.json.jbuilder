json.extract! reservation, :id, :start_date, :finish_date, :proper_price, :changed_price, :changed_count_of_person, :user_id, :room_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)