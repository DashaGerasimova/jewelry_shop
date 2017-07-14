Rails.application.routes.draw do

mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

get 'profile', to: 'user#profile'

get "cart_items/destroy" => "cart_items#destroy"

devise_for :users
resources :products do
  resources :comments
end 
resources :cart_items

root to:'products#index'
end
