Rails.application.routes.draw do
  # get 'cart/show'
  get 'cart', to: "cart#show"
  post 'cart/add'
  post 'cart/remove'

  resources :products
  #  root "products#index"

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
