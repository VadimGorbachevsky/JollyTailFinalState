class AddName1ToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :name1, :string
  end
end
