class AddRealUrlFlagsToCategories < ActiveRecord::Migration[5.2]
    def change
      add_column :categories, :url, :string
      add_column :categories, :flags, :string
      add_column :categories, :real, :boolean
    end
end
