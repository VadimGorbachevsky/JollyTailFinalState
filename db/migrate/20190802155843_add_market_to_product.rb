class AddMarketToProduct < ActiveRecord::Migration[5.2]
  def change
      add_column :products, :market, :boolean, default: "false"
  end
end
