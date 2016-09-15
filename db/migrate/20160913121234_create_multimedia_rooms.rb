class CreateMultimediaRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :multimedia_rooms do |t|
      t.belongs_to :room, foreign_key: true
      t.belongs_to :multimedia, foreign_key: true
      t.string :type_of_display

      t.timestamps
    end
  end
end
