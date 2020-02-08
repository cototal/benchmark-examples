Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :authors
  root "home#index"
end
