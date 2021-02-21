class AddTimetagToAccias < ActiveRecord::Migration[5.2]
  def change
    add_column :accia, :starttime, :datetime, default: "2200-01-01 00:00:01"
    add_column :accia, :endtime, :datetime, default: "2200-01-01 00:00:01"
  end
end
