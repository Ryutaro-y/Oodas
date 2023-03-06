Rails.application.routes.draw do
  resources :suppliers
  resources :inks
  resources :stocks
  resources :locations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
