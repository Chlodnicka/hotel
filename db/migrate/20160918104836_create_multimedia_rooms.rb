class CreateMultimediaRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :multimedia_rooms do |t|
      t.references :room, foreign_key: true
      t.references :multimedia, foreign_key: true

      t.timestamps
    end
  end
end
