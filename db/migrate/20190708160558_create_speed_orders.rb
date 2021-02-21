class CreateSpeedOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :speed_orders do |t|

        t.string :phone
        t.integer :product_id
        t.timestamps
    end
  end
end
