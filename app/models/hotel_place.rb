class HotelPlace < ApplicationRecord

  has_many :multimedia_hotels
  has_many :multimedia, :through => :multimedia_hotels

end
