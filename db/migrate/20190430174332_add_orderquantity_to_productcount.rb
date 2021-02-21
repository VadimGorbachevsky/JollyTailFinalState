class AddOrderquantityToProductcount < ActiveRecord::Migration[5.2]
  def change
    add_column :productcounts, :ordercount, :integer, default: 0
  end
end
