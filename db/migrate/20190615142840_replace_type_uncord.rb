class ReplaceTypeUncord < ActiveRecord::Migration[5.2]
 def change
    remove_column :uncountorders, :product_id
    add_column :uncountorders, :product_id, :string
	
 end
end
