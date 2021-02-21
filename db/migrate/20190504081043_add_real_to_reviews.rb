class AddRealToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :real, :boolean, default: false
  end
end
