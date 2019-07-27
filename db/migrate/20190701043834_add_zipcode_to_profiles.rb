class AddZipcodeToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :zipcode, :string
  end
end
