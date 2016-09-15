class TypeOfRoom < ApplicationRecord
  has_many :room_types
  has_many :rooms, :through => :room_types
end
