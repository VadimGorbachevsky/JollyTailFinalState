ActiveAdmin.register Order do
 menu label: "Заказы"
 permit_params :user_id, :position_ids, :phone, :card

 index do
    selectable_column
    id_column
    column "Покупатель" do |order|
        order.user_id ? order.user_id : "Ошибка / Не привязано к пользователю"
    end
    column "ID товара : Количество" do |order|
        order.positions ? order.positions.map { |e| e.product_id.to_s+":"+e.quantity.to_s+"\n" } : "Ошибка / Пустой заказ"
    end
    column "Сумма" do |order|
        @a = 0
        if (order.positions)
            order.positions.map do |e| 
                if ( (Product.find(e.product_id).accia_id != 1) && (Accia.find(Product.find(e.product_id).accia_id).endtime > Time.now()) )
                    @a = @a + Product.find(e.product_id).action_price * e.quantity
                else
                    @a = @a + Product.find(e.product_id).price * e.quantity
                end
            end
        end
        @a
    end
    column "Бонусная карта" do |order|
     order.card ? order.card : " - "
   end
   column "Телефон" do |order|
     order.phone ? order.phone : "Ошибка / Телефон не указан"
   end
   column "Минут назад:" do |order|
     ((Time.now() - order.updated_at) / 60).floor
   end
   actions
 end
end
