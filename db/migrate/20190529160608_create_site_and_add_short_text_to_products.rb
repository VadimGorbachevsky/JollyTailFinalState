class CreateSiteAndAddShortTextToProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :delivery
      t.string :slug
    end
    
    add_column :products, :short_text, :string, default: ""
  end
end
