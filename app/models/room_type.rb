class RoomType < ApplicationRecord
  belongs_to :type_of_room
  belongs_to :room
end
