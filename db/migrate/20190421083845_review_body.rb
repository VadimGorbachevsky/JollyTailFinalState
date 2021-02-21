class ReviewBody < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :body, :string
  end
end
