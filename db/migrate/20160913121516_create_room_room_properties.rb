class CreateRoomRoomProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :room_room_properties do |t|
      t.belongs_to :room, foreign_key: true
      t.belongs_to :room_properties, foreign_key: true

      t.timestamps
    end
  end
end
