class AddStreetToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :street, :string
  end
end
