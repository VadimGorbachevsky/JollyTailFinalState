class AddTextToCat < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :text_1, :string, default: ""
    add_column :categories, :text_2, :string, default: ""
  end
end
