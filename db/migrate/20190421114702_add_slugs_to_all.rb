class AddSlugsToAll < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :slug, :string, null: false, default: "something"
    add_index :reviews, :slug

    add_column :users, :slug, :string, null: false, default: "something"
    add_index :users, :slug

    add_column :products, :slug, :string, null: false, default: "something"
    add_index :products, :slug

    add_column :categories, :slug, :string, null: false, default: "something"
    add_index :categories, :slug

    add_column :carts, :slug, :string, null: false, default: "something"
    add_index :carts, :slug

    add_column :posts, :slug, :string, null: false, default: "something"
    add_index :posts, :slug

    add_column :orders, :slug, :string, null: false, default: "something"
    add_index :orders, :slug
  end
end
