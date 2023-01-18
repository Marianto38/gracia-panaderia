Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'



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
end
