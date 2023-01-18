Rails.application.routes.draw do
  devise_for :users

  resources :contracts
  resources :batches

  resources :clients do
    resources :addresses
    resources :phones
  end
  resources :payments
  get "payments/new_with_contract/:contract_id", to: "payments#new", as: :new_with_contract

  root "home#index"

  get "client_results", to: "clients#results", as: :client_results

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
