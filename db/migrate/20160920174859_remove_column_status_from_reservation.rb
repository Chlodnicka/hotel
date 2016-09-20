class RemoveColumnStatusFromReservation < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :status
  end
end
