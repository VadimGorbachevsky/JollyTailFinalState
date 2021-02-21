class AddUserIdToReviewsCartsAndOrders < ActiveRecord::Migration[5.2]
    def change
        add_column :carts, :user_id, :integer
        add_column :reviews, :user_id, :integer
        add_column :orders, :user_id, :integer
  end
end
