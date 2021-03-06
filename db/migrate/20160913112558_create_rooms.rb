class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :count_of_person
      t.float :price
      t.integer :bathroom
      t.text :description
      t.references :hotel_place, foreign_key: true

      t.timestamps
    end
  end
end
