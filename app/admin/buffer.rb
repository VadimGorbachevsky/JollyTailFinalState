ActiveAdmin.register Buffer do
      permit_params :image, :id

      index do
          selectable_column
          id_column
          column "Изображение" do |buffer|
            buffer.image.attached? ? image_tag(url_for(buffer.image), size: "50x50") : "Изображение не установлено"
          end
          actions
        end

end
