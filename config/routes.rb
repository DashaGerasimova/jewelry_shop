Rails.application.routes.draw do
  resources :jewels
  
  root 'jewels#index'
end
