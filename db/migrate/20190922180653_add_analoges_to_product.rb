class AddAnalogesToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :analoges, :string, default: ""
  end
end
