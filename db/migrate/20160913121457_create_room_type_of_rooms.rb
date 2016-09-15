class CreateRoomTypeOfRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :room_type_of_rooms do |t|
      t.belongs_to :room, foreign_key: true
      t.belongs_to :type_of_room, foreign_key: true

      t.timestamps
    end
  end
end
