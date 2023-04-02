Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  resources :users, only: :show
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  get '/item/new', to: 'items#new'
  post '/items/new', to: 'items#create'
end