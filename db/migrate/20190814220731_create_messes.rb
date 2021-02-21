class CreateMesses < ActiveRecord::Migration[5.2]
  def change
    create_table :messes do |t|
        t.integer :chat_id
        t.boolean :user
        t.string :body
        t.timestamps
    end
  end
end
