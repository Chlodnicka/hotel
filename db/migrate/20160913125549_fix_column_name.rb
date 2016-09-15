class FixColumnName < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :users, :password, :email
  end

  def self.down

  end
end
