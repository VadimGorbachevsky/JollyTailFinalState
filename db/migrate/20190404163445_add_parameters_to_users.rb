class AddParametersToUsers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :name, :string, default: ""
      add_column :users, :telephone, :string, default: ""
      #Вы можете указать свой город. Так нам будет проще подобрать для вас че-то.
      add_column :users, :city, :string, default: ""
      add_column :users, :subscriber, :boolean, default: false
      add_column :users, :card_number, :string, default: ""

      add_index :users, :name
      add_index :users, :telephone
      add_index :users, :card_number
  end

end
