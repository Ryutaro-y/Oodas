Rails.application.routes.draw do

  get 'guest_login', to: 'guest_sessions#new'
  post 'guest_login', to: 'guest_sessions#create'
  delete 'logout', to: 'guest_sessions#destroy'
  root to: 'top#index'
  resources :orders
  resources :suppliers
  resources :inks
  resources :stocks
  resources :locations
  resources :users
  get 'search', to: 'searches#search'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
