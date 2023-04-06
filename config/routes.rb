Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  resources :users, only: :show
  resources :items do
  resources :purchase_shipping_addresses, only: [:index, :create]
  end
  get '/item/new', to: 'items#new'
  post '/items/new', to: 'items#create'
  end