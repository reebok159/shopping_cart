ShoppingCart::Engine.routes.draw do

  resources :orders, only: %i[index show]
  resources :order_items, only: %i[create update destroy]
  get 'cart', to: 'orders#cart', as: 'cart_page'
  post 'cart', to: 'orders#activate_coupon', as: 'activate_coupon'

  get 'checkout/start', to: 'checkout#start', as: 'checkout_start'
  get 'checkout(/:edit)', to: 'checkout#index', as: 'checkout'
  put 'checkout/edit_data', as: 'checkout_edit'
  get 'checkout/next_stage', to: redirect('checkout')
  put 'checkout/next_stage', as: 'checkout_next'
end
