class AddFollowsToProduct < ActiveRecord::Migration[5.2]
  def change
      add_column :products, :follows, :string, default: ""
  end
end
