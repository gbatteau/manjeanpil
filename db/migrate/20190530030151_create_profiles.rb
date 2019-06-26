class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :restaurant_name
      t.string :address
      t.string :city
      t.string :state
      t.string :cuisine
      t.string :website
      t.string :hours
      t.string :phone_number
      t.timestamps
    
    end
  end
end
