class AddProductsIdsToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :product_ids, :integer, array: true, default: []
  end
end
