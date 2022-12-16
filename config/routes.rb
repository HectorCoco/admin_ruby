Rails.application.routes.draw do
  resources :contracts
  devise_for :users

  resources :batches
  resources :addresses
  resources :phones
  resources :clients

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
