class Multimedium < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :multimedia_rooms
  has_many :rooms, :through => :multimedia_rooms

  has_many :multimedia_hotels
  has_many :hotel_places, :through => :multimedia_hotels
end
