ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: "Главная"

  content title: proc{ I18n.t("active_admin.dashboard") } do


    div class: "base_updater" do

    end
    div  do
      link_to "Обновить базу", products_update_all_url, style: "font-size: 24px;"
    end
    div  do
      link_to "Обновить слаги", update_slug_url, style: "font-size: 24px;"
    end
    div  do
      link_to "Пробросить описания", update_desc_url, style: "font-size: 24px;"
    end
    div  do
      link_to "Сгенерировать YML для Маркета", generate_yml_url, style: "font-size: 24px;"
    end
    div  do
      link_to "Снести пустые заказы", exterminatus_url, style: "font-size: 24px;"
    end
  end # content
end
