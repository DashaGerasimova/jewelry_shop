Rails.application.routes.draw do
  devise_for :users
  resources :jewels
  
  root to:'jewels#index'
end
