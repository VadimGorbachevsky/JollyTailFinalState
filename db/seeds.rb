# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.production?

#Categories roots
Category.create!(name: 'Собаки', real:true, ancestry: nil) if Rails.env.production?
Category.create!(name: 'Кошки',  real:true, ancestry: nil) if Rails.env.production?
Category.create!(name: 'Гигиена и витамины', real:true,  ancestry: nil) if Rails.env.production?
Category.create!(name: 'Птицы и грызуны', real:true,  ancestry: nil) if Rails.env.production?
Category.create!(name: 'Рыбы, черепахи', real:true,  ancestry: nil) if Rails.env.production?

#Categories first level for Dogs
Category.create!(name: 'Корма', ancestry: '1') if Rails.env.production?
Category.create!(name: 'Мясо', ancestry: '6/9') if Rails.env.production?
Category.create!(name: 'Сухие', ancestry: '6/9') if Rails.env.production?
Category.create!(name: 'Влажные', ancestry: '6/9') if Rails.env.production?
Category.create!(name: 'Диеты', ancestry: '6/9') if Rails.env.production?

Category.create!(name: 'Аммуниция', ancestry: '1') if Rails.env.production?
Category.create!(name: 'Ошейники', ancestry: '6/10') if Rails.env.production?
Category.create!(name: 'Поводки', ancestry: '6/10') if Rails.env.production?
Category.create!(name: 'Рулетки', ancestry: '6/10') if Rails.env.production?
Category.create!(name: 'Намордники', ancestry: '6/10') if Rails.env.production?
Category.create!(name: 'Для выставок', ancestry: '6/10') if Rails.env.production?
Category.create!(name: 'Для дрессировки', ancestry: '6/10') if Rails.env.production?


Category.create!(name: 'Игрушки', ancestry: '1') if Rails.env.production?
Category.create!(name: 'Лакомства', ancestry: '1') if Rails.env.production?
Category.create!(name: 'Одежда', ancestry: '1') if Rails.env.production?
Category.create!(name: 'Лежанки', ancestry: '1') if Rails.env.production?
Category.create!(name: 'Миски', ancestry: '1') if Rails.env.production?
Category.create!(name: 'Груминг', ancestry: '1') if Rails.env.production?
Category.create!(name: 'Корректоры поведения', ancestry: '1') if Rails.env.production?

#Category.create!(name: 'Переноски, клетки, сумки', ancestry: '6') if Rails.env.production?

#Categories first level for Cats
Category.create!(name: 'Корма', ancestry: '7') if Rails.env.production?
Category.create!(name: 'Наполнители', ancestry: '7') if Rails.env.production?
Category.create!(name: 'Лотки', ancestry: '7') if Rails.env.production?
Category.create!(name: 'Аммуниция', ancestry: '7') if Rails.env.production?
Category.create!(name: 'Игрушки', ancestry: '7') if Rails.env.production?
Category.create!(name: 'Лакомства', ancestry: '7') if Rails.env.production?
Category.create!(name: 'Одежда', ancestry: '7') if Rails.env.production?
Category.create!(name: 'Миски', ancestry: '7') if Rails.env.production?
Category.create!(name: 'Груминг', ancestry: '7') if Rails.env.production?
Category.create!(name: 'Корректоры поведения', ancestry: '7') if Rails.env.production?
Category.create!(name: 'Переноски, сумки', ancestry: '7') if Rails.env.production?

Accia.create!(id: 1, name: "Default") if Rails.env.production?

Product.create!(category_id: 33, accia_id: 1, name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33, accia_id: 1, name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33, accia_id: 1, name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33, accia_id: 1, name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33, accia_id: 1, name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33, accia_id: 1, name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33, accia_id: 1, name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33,  accia_id: 1,name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33,  accia_id: 1,name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33,  accia_id: 1,name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33,  accia_id: 1,name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33,  accia_id: 1,name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33,  accia_id: 1,name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33,  accia_id: 1,name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33,  accia_id: 1,name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33,  accia_id: 1,name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?
Product.create!(category_id: 33,  accia_id: 1,name: "Очередной засеянный товар", price: 12, action_price: 10, description: "Описание", brand: "Какой-то бренд", real: true, flags: "") if Rails.env.production?


Productcount.create!(product_id: 1, count: 1) if Rails.env.production?
Productcount.create!(product_id: 2, count: 1) if Rails.env.production?
Productcount.create!(product_id: 3, count: 1) if Rails.env.production?
Productcount.create!(product_id: 4, count: 1) if Rails.env.production?
Productcount.create!(product_id: 5, count: 1) if Rails.env.production?
Productcount.create!(product_id: 6, count: 1) if Rails.env.production?
Productcount.create!(product_id: 7, count: 1) if Rails.env.production?
Productcount.create!(product_id: 8,  count: 1) if Rails.env.production?
Productcount.create!(product_id: 9,  count: 1) if Rails.env.production?
Productcount.create!(product_id: 10,  count: 1) if Rails.env.production?
Productcount.create!(product_id: 11,  count: 1) if Rails.env.production?
Productcount.create!(product_id: 12,  count: 1) if Rails.env.production?
