class CreateMultimedia < ActiveRecord::Migration[5.0]
  def change
    create_table :multimedia do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
