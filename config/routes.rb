Rails.application.routes.draw do
  get 'user/profile'

  devise_for :users
  resources :jewels
  
  root to:'jewels#index'
end
