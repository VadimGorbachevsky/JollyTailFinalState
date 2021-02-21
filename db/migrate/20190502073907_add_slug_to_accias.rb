class AddSlugToAccias < ActiveRecord::Migration[5.2]
  def change
    add_column :accia, :slug, :string, default: "something"
  end
end
