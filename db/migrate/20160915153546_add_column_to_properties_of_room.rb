class AddColumnToPropertiesOfRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :properties_of_rooms, :room_id, :integer
    add_column :properties_of_rooms, :rooms_property_id, :integer
  end
end
