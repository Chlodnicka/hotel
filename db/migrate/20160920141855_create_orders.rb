class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :reservation_id
      t.string :ip_address
      t.string :email
      t.string :card_type
      t.date :card_expires_on

      t.timestamps
    end
  end
end
