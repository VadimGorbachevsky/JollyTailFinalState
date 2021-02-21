class AddParametersToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :positions, :order_id, :integer

    remove_column :carts, :product_ids
  end
end
