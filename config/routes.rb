Rails.application.routes.draw do

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
