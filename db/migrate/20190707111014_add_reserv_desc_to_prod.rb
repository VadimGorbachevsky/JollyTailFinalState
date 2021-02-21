class AddReservDescToProd < ActiveRecord::Migration[5.2]
  def change
      add_column :products, :desc, :string, default: ''
  end
end
