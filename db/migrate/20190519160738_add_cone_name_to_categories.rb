class AddConeNameToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :cone_name, :string, default: ""
  end
end
