class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :description
      t.string :restaurant_name
      t.string :prices
      t.string :address
      t.string :distance
      t.string :specials
      t.string :expire
      
      t.timestamps
    end
  end
end
