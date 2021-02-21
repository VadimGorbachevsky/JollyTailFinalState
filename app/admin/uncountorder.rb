ActiveAdmin.register Uncountorder do
 menu label: "Заявки"
 permit_params :product_id, :count, :contact
 
 end