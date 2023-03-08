Rails.application.routes.draw do
  resources :orders
  resources :suppliers
  resources :inks
  resources :stocks
  resources :locations
  resources :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
