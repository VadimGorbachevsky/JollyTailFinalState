class AddAddingsalesToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :addingsales, :string, default: ""
  end
end
