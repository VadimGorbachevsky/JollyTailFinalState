class CreateBrandText < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
        t.string :name
        t.string :text
    end
  end
end
