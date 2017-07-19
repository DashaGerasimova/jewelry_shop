Rails.application.routes.draw do

mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

get 'profile', to: 'user#profile'
get 'carts/destroy' => 'carts#destroy'

devise_for :users
resources :products do
  resources :comments
end 
resources :carts

root to:'products#index'
end
