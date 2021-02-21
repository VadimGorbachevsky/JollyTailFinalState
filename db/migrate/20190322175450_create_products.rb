class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.float :price
      t.float :action_price
      t.string :description
      t.string :brand
      t.boolean :real
      t.string :flags
      t.timestamps
    end
  end
end
