class AddParamsToOrders < ActiveRecord::Migration[5.2]
  def change
      add_column :orders, :pay_method, :string, default: ""
      add_column :orders, :delivery, :string, default: ""
  end
end
