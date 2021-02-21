ActiveAdmin.register Product do
     menu label: "Товары"
      permit_params  :category_id, :accia_id, :name, :price, :desc, :action_price, :description, :brand, :real, :flags, :images, :name1, :main, :follows, :currentfas, :market, :addingsales, :analoges, :market_desc, :cart_ids => []


      index do
          selectable_column
          id_column
          column "Категория" do |product|
            product.category.admin_name
          end
          column "Бренд" do |product|
            product.brand ? product.brand : ""
          end
          column "Наименование" do |product|
            (product.name != "" && product.name) ?  product.name : "!Ошибка / Наименование не установлено"
          end
          column "Рабочее название" do |product|
            (product.name1 != "" && product.name1) ?  product.name1 : "!Ошибка / Рабочее название не установлено"
          end
          column "Цена" do |product|
            product.price ? product.price : "!Ошибка / Цена не установлена"
          end
          column "Акционный?" do |product|
            product.accia ? product.accia.name : "Нет"
          end
          column "Акционная цена" do |product|
            product.action_price ? product.action_price : "!Предупреждение / Акционная цена не установлена"
          end
          column "Количество" do |product|
            product.productcount ? product.productcount.count : "!Ошибка / Количество не установлено"
          end
          column "Изображение" do |product|
            if product.images.attached?

                images = []
                product.images.each do |image|
                  images.push image_tag image, size: "50x50"
                end
                content_tag :div, images.join("\n").html_safe, class: "img-circle"

            else
               "Изображение не установлено"
            end
          end
          column "Отображать" do |product|
            product.real
          end
          column "Головной" do |product|
            product.main
          end
          column "Фасовки" do |product|
            product.follows
          end
          column "Фасовка" do |product|
            product.currentfas
          end
          actions
        end

        filter :category_id, :as => :select, :collection => Category.all.map { |e| [e.admin_name, e.id]}
        filter :name
        filter :real
        filter :market
        filter :brand
        filter :accia_id, :as => :select, :collection => Accia.all.map { |e| [e.name, e.id]}

    form do |f|
          f.inputs do
            f.input :name
            f.input :name1
            f.input :brand
            f.input :description, :as => :trix_editor 
            f.input :market_desc, :as => :trix_editor 
            f.input :category_id, :as => :select, :collection => Category.all.map { |e| [e.admin_name, e.id]}
            f.input :accia_id, :as => :select, :collection => Accia.all.map { |e| [e.name, e.id]}
            f.input :price
            f.input :action_price
            f.input :flags
            f.input :real
            f.input :main
            f.input :follows
            f.input :analoges
            f.input :addingsales
            f.input :currentfas
            f.input :market
            if f.object.images.attached?
                f.object.images.each do |img|
                    div class: "some_class" do
                        span image_tag(img, size: "100x100")
                        span link_to "delete", delete_product_image_admin_product_path(img.id), method: :delete
                    end
                end
            end
            f.input :images, :as => :file
          end
          f.actions
    end

        after_create do
          resource.slug = Russian.translit(resource.name).parameterize
          resource.save()
        end
        
        after_update do
            if resource.desc.length < resource.description.length
                resource.desc = resource.description
            end
            resource.save()
        end
        
        member_action :delete_product_image, method: :delete do
            @pic = ActiveStorage::Attachment.find(params[:id])
            @pic.purge_later
            redirect_back(fallback_location: edit_admin_product_path)   
        end

end
