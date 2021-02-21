ActiveAdmin.register Accia do
     menu label: "Акции"
 permit_params :name, :description, :real, :image, :starttime, :endtime, :promo


  index do
     selectable_column
     id_column
     column "Наименование" do |accia|
       (accia.name != "" && accia.name) ?  accia.name : "!Ошибка / Наименование не установлено"
     end
     column "Описание" do |accia|
       (accia.description != "" && accia.description) ?  accia.description : "!Ошибка / Описание не установлено"
     end
     column "Товаров" do |accia|
       (accia.products) ?  accia.products.size : 0
     end
     column "Начало" do |accia|
       accia.starttime
     end
     column "Окончание" do |accia|
       accia.endtime
     end
    column "Изображение" do |accia|
       accia.image.attached? ? image_tag(url_for(accia.image), size: "50x50") : "Изображение не установлено"
     end
     column "Отображать" do |accia|
       accia.real
     end
     column "Промо" do |accia|
       accia.promo
     end
     actions
   end

   form do |f|
     f.inputs do
       f.input :name
       f.input :description
       f.input :starttime, start_year: 2019
       f.input :endtime, start_year: 2019
       f.input :real
       f.input :promo
       f.input :image, :as => :file
     end
     f.actions
   end

   controller do

     after_create do
       resource.slug = Russian.translit(resource.name).parameterize
       resource.save()
     end

   end


end
