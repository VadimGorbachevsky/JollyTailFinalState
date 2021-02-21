ActiveAdmin.register Category do
 menu label: "Категории"
 permit_params :name, :admin_name, :image, :ancestry, :real, :flags, :url, :cone_name, :text_1, :text_2

index :title => 'Категории' do
          selectable_column
          id_column
          column "Имя" do |category|
            category.name
          end
          column "Тайтл" do |category|
            category.admin_name ? category.admin_name : ""
          end
          column "Дерево" do |category|
            category.ancestry
          end
          column "Real" do |category|
            category.real
          end
          column "1C" do |category|
            category.cone_name
          end
          column "Поисковик" do |category|
            category.text_1
          end
          column "Бренды" do |category|
            category.flags ? category.flags : "nil"
          end
          column "Посадка" do |category|
            category.text_2
          end
          actions
end

form do |f|
          f.inputs do
            f.input :name, label: "Название"
            f.input :admin_name, label: "Тайтл"
            f.input :ancestry, label: "Дерево"
            f.input :flags, label: "Бренды"
            f.input :real, label: "Real"
            f.input :cone_name, label: "1C"
            f.input :text_1, label: "Поисковик"
            f.input :text_2, label: "Посадка"
            f.input :image, :as => :file
          end
          f.actions
end


 after_create do
   resource.slug = Russian.translit(resource.name).parameterize
   resource.save()
 end
 
 
 
end
