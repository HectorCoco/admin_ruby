Rails.application.routes.draw do
  devise_for :users

  resources :contracts
  resources :batches
  resources :addresses
  resources :phones
  resources :clients

  root "home#index"

  get "client_results", to: "clients#results", as: :client_results
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
