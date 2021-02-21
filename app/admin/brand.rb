ActiveAdmin.register Brand do
    menu label: "Бренды"
    permit_params :name, :text

    index do
        selectable_column
        id_column
        column "Имя" do |brand|
            brand.name ? brand.name : "Имя еще не указано"
        end
        column "Текст" do |brand|
            brand.text ? brand.text : "Текст еще не написан"
        end
        actions
    end
    
    form do |f|
          f.inputs do
            f.input :name
            f.input :text, :as => :trix_editor 
          end
          f.actions
    end

end
