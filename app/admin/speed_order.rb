ActiveAdmin.register Speed_order do
 menu label: "Быстрые заказы"
 permit_params :product_id, :phone

 index do
    selectable_column
    id_column
    column "Товар" do |speed_order|
         if speed_order.product_id 
            Product.find(speed_order.product_id).name + " " + (Product.find(speed_order.product_id).currentfas ? Product.find(speed_order.product_id).currentfas : '') 
         else
            "Ошибка"
         end
    end
    column "Телефон" do |speed_order|
        speed_order.phone ? speed_order.phone : "Ошибка / Телефон не указан"
    end
    column "Часов назад:" do |speed_order|
        ((Time.now() - speed_order.updated_at) / 3600).floor
    end
    actions
 end
end
