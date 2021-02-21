Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'startpage/index'
  root 'startpage#index'
  get 'robots' => 'politic#robots', format: :text
  get 'clothes', to: 'politic#clothes', as: :clothes
  get 'politic', to: 'politic#index.html', as: :politic
  get 'delivery', to: 'politic#delivery', as: :delivery
  get 'sitemap', to: 'politic#sitemap', as: :sitemap
  get 'credits', to: 'politic#credits', as: :credits
  get 'exterminatus', to: 'orders#exterminatus', as: :exterminatus
  get 'create_post_good', to: 'products#create_post_good', as: :create_post_good
  get 'reget', to: 'politic#reget.html', as: :reget
  get 'new_root', to: 'politic#new_root.html', as: :new_root
  get 'company_registration', to: 'registrations#company_registration', as: :company_registration
  
  resources :products
  resources :sites
  resources :messes
  resources :chats
  resources :users
  resources :brands
  resources :categories
  resources :carts
  resources :orders
  resources :accias
  resources :positions
  resources :reviews
  resources :buffers
  resources :uncountorders
  resources :speed_orders

  get 'update_all', to: 'products#update_all', as: :products_update_all
  get 'search', to: 'products#search', as: :search
  get 'generate_yml', to: 'products#generate_yml', as: :generate_yml
  get 'update_slug', to: 'products#update_slug', as: :update_slug
  get 'update_desc', to: 'products#update_desc', as: :update_desc
  get 'download_price_yml', to: 'products#download_price_yml', as: :download_price_yml
  get 'image_sender', to: 'products#image_sender', as: :image_sender
  get 'image_cat_sender', to: 'categories#image_cat_sender', as: :image_cat_sender
  get '403', to: 'errors#403.html', as: :_403

  get 'order_step', to: 'orders#step', as: :order_step
  post 'first_guest_taken', to: 'users#first_guest_taken', as: :first_guest_taken
  post 'create_not_register', to: 'orders#create_not_register', as: :create_not_register
  get 'kvitok', to: 'uncountorders#kvitok', as: :kvitok
  
  get 'card', to: 'orders#card', as: :card
  get 'card_step', to: 'orders#card_step', as: :card_step
  
  get 'adding', to: 'categories#adding', as: :adding
end
