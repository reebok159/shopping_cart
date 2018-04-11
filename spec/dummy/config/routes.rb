Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:show]
  mount ShoppingCart::Engine => "/shopping_cart"
end
