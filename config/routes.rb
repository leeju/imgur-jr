Rails.application.routes.draw do

  root 'photos#index'

  resources :photos
  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

end
