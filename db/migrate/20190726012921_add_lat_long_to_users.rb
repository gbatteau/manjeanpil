class AddLatLongToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lat, :decimal
    add_column :users, :long, :decimal
  end
end
