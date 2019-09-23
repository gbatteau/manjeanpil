class AddSpecialTypeToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :special_type, :string
  end
end
