Rails.application.routes.draw do
  get 'profile', to: 'user#profile'

  devise_for :users
  resources :products do
  	resources :comments
  end
  
  root to:'products#index'
end
