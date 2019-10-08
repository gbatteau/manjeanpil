class AddImpressionsCountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :impressions_count, :integer, default: 0
  end
end
