class RoomProperty < ApplicationRecord
  has_many :properties_of_rooms
  has_many :rooms, :through => :properties_of_rooms
end
