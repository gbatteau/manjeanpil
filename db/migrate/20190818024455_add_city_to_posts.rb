class AddCityToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :city, :string
    add_column :posts, :state, :string
    add_column :posts, :zipcode, :string
  end
end
