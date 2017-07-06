Rails.application.routes.draw do
  get 'profile', to: 'user#profile'

  devise_for :users
  resources :jewels
  
  root to:'jewels#index'
end
