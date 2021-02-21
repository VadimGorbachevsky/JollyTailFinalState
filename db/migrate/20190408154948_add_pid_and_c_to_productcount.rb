class AddPidAndCToProductcount < ActiveRecord::Migration[5.2]
  def change
    add_column :productcounts, :product_id, :integer
    add_column :productcounts, :count, :integer

    add_index :productcounts, :product_id
  end
end
