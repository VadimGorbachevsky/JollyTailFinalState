class AddAdminNameToCategory < ActiveRecord::Migration[5.2]
  def change
        add_column :categories, :admin_name, :string
  end
end
