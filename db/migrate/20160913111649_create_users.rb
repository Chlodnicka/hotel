class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :firstname
      t.string :lastname
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
