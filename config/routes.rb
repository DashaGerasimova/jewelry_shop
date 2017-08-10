Rails.application.routes.draw do

  resources :answers
mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

get 'profile', to: 'user#profile'
get 'carts/destroy' => 'carts#destroy'

devise_for :users
resources :products do
  resources :comments
end 
resources :carts

resources :order_products
resources :orders

root to:'products#index'
end
