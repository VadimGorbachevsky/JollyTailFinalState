class CreateAccia < ActiveRecord::Migration[5.2]
  def change
    create_table :accia do |t|
      t.string :name
      t.string :description
      t.boolean :real
      t.timestamps
    end
  end
end
