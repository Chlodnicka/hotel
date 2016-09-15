class CreatePropertiesOfRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :properties_of_rooms do |t|

      t.timestamps
    end
  end
end
