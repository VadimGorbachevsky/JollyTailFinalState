class AddCardToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :card, :string
  end
end
