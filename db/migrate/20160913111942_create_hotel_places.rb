class CreateHotelPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :hotel_places do |t|
      t.string :name
      t.string :street
      t.integer :numer
      t.string :city_code
      t.string :city
      t.string :phone_numbers
      t.string :email_addresses
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
