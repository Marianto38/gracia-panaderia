Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
   get '/store', to: 'store#index'



   root to: 'pages#home', as: :home

  #  root 'store#index', as: 'store_index', via: :all

  # get 'cart/show'
  # get 'cart', to: "cart#show"
  # post 'cart/add'
  # post 'cart/remove'

  resources :products
  #  root "products#index"

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
