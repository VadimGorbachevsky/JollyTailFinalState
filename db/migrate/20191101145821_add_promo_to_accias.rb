class AddPromoToAccias < ActiveRecord::Migration[5.2]
  def change
      add_column :accia, :promo, :boolean, default: false
  end
end
