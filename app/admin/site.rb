ActiveAdmin.register Site do
   menu label: "Тексты"
   permit_params :delivery

        form do |f|
          f.inputs do
            f.input :delivery, :as => :trix_editor 
          end
          f.actions
        end

end
