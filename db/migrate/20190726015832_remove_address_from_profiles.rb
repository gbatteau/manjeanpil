class RemoveAddressFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :address, :string
  end
end
