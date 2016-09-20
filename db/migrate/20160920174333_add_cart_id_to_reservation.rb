class AddCartIdToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :cart_id, :integer
    add_foreign_key :reservations, :carts
  end
end
