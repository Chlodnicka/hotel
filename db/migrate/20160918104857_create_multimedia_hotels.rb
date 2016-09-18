class CreateMultimediaHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :multimedia_hotels do |t|
      t.references :hotel_place, foreign_key: true
      t.references :multimedia, foreign_key: true

      t.timestamps
    end
  end
end
