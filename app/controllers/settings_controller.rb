class SettingsController < ApplicationController

  def index
    @room_properties = RoomProperty.all
    @room_types = TypeOfRoom.all
  end

end
