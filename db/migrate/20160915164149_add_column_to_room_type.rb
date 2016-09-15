class AddColumnToRoomType < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :room_id, :integer
    add_column :room_types, :type_of_room_id, :integer
  end
end
