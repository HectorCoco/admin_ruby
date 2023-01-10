Rails.application.routes.draw do
  devise_for :users

  resources :contracts
  resources :batches
  resources :addresses
  resources :phones
  resources :clients

  root "home#index"

  get "client_results", to: "clients#results", as: :client_results
  get "phones/new_phone_with_client/:client_id", to: "phones#new", as: :new_phone_with_client
  get "addresses/new_address_with_client/:client_id", to: "addresses#new", as: :new_address_with_client

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
