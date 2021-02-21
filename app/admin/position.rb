ActiveAdmin.register Position do
 menu label: "Позиции"
 permit_params :cart_id, :product_id, :quantity, :order_id

 index do
   selectable_column
   id_column
   column "Корзина №" do |position|
     position.cart_id ? position.cart_id : "Оформлено в заказ"
   end
   column "Наименование" do |position|
     position.product.name + " " + position.product.currentfas
   end
   column "Количество" do |position|
     position.quantity ? position.quantity : "Ошибка / Не указано количество"
   end
   column "Заказ №" do |position|
     (position.order_id && position.order_id != 29) ? position.order_id : "Не оформлено"
   end
   actions
 end

    filter :order_id, :as => :select, :collection => Order.all.map { |e| [e.id]}
    filter :cart_id

 form do |f|
   f.inputs do
     f.input :cart_id, :as => :select,
                           :collection => Cart.all.map { |e| e.id}
     f.input :product_id
     f.input :order_id, :as => :select,
                           :collection => Order.all.map { |e| e.id}
     f.input :quantity
   end
   f.actions
 end


end
