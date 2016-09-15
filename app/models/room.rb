class Room < ApplicationRecord

  has_many :properties_of_rooms
  has_many :room_properties, :through => :properties_of_rooms

  has_many :room_types
  has_many :type_of_rooms, :through => :room_types

end
