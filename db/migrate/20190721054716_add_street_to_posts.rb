class AddStreetToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :street, :string
  end
end
