class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :restaurant_name
      t.string :location
      t.string :distance
      t.string :mile
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :expire
      t.string :price
      t.string :discount
      t.integer :user_id
      

      t.timestamps
    end
  end
end
