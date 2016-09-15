class RoomTypeOfRoom < ApplicationRecord
  belongs_to :room
  belongs_to :type_of_room
end
