class AddMarketDeskToProduct < ActiveRecord::Migration[5.2]
  def change
      add_column :products, :market_desc, :string, default: ""
  end
end
