class AddCurrentfasToProduct < ActiveRecord::Migration[5.2]
  def change
      add_column :products, :currentfas, :string, default: ""
  end
end
