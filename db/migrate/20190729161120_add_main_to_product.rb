class AddMainToProduct < ActiveRecord::Migration[5.2]
  def change
      add_column :products, :main, :boolean, default: "false"
  end
end
