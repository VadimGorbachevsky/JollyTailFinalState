class AddTextToProd < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :text_1, :string, default: ""
    add_column :products, :text_2, :string, default: ""
  end
end
