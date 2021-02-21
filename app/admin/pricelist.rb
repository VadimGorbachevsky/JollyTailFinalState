ActiveAdmin.register Pricelist do
 menu label: "Прайс"
 permit_params :id, :image
 
 form do |f|
          f.inputs do
            f.input :image, :as => :file
          end
          f.actions
    end
end