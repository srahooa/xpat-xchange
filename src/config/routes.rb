Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get 'pages/contact'
  get 'pages/about'
  get 'orders/complete', to: 'orders#complete', as: 'orders_complete'
  get 'orders/cancel'
  get 'orders/:product_id', to: 'orders#new', as: "new_order"
 

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
