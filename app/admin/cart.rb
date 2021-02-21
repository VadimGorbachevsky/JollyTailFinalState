ActiveAdmin.register Cart do
     menu label: "Корзины"
  permit_params :user_id

  index do
    selectable_column
    id_column
    column "Покупатель" do |cart|
      cart.user_id ? cart.user_id : "Ошибка / Пользователь не установлен"
    end
    column "Позиции" do |cart|
      cart.positions.length > 0 ? cart.positions.map { |e| e.id } : "Корзина пуста"
    end
    actions
  end

end
