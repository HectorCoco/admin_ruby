Rails.application.routes.draw do
  devise_for :users

  resources :contracts
  resources :batches

  resources :clients do
    resources :addresses
    resources :phones
  end
  resources :payments

  root "home#index"

  get "client_results", to: "clients#results", as: :client_results

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
