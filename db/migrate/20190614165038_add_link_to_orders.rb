class AddLinkToOrders < ActiveRecord::Migration[5.2]
  def change
       add_column :orders, :link, :string, default: ""
  end
end
