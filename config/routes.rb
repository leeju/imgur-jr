Rails.application.routes.draw do

  root 'photos#index'

  resources :photos
  resources :users, only: [:new, :create] #:destroy]

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout
end
