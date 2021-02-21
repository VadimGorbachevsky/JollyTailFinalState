ActiveAdmin.register Mess do
     menu label: "Сообщения/тест"
 permit_params :id, :chat, :body, :user


  index do
     selectable_column
     column "Чат" do |mess|
       (mess.chat) ?  mess.chat : "!Ошибка / Наименование не установлено"
     end
     column "Оставлен юзером?" do |mess|
       mess.user ? mess.user : "ups"
     end
     column "Сообщение" do |mess|
       mess.body ? mess.body : "ups"
     end
     id_column
     actions
   end


end
