json.extract! room, :id, :name, :count_of_person, :price, :bathroom, :description, :hotel_place_id, :created_at, :updated_at
json.url room_url(room, format: :json)