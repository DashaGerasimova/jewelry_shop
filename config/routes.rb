Rails.application.routes.draw do

mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

get 'profile', to: 'user#profile'

devise_for :users, controllers:{sessions: 'sessions'}
resources :products do
  resources :comments
end 

resources :cart_items
resources :carts, only: :destroy
  root to:'products#index'
end
