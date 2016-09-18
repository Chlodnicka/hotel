class ChangeColumnTypeInMultimedia < ActiveRecord::Migration[5.0]
  change_table :multimedia do |t|
    t.change :image, :string
  end
end
