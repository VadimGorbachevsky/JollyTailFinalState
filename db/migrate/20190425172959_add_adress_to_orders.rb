class AddAdressToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :adress, :string
  end
end
