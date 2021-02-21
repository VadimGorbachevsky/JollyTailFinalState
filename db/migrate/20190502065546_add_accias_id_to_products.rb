class AddAcciasIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :accia_id, :integer, default: 1
  end
end
