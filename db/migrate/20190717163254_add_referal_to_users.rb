class AddReferalToUsers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :referal_code, :string, default: 'none'
  end
end
