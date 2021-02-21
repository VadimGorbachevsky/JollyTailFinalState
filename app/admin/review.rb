ActiveAdmin.register Review  do
     menu label: "Отзывы"
   permit_params :title, :body, :user_id, :real, :answer


end
