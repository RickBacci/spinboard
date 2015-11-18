Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :links, only: [:index]
  resources :sessions, only: [:new, :create]

  root 'links#index'

end
