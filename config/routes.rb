Rails.application.routes.draw do

  root 'photos#index'

  concern :votable do
    resources :votes, only: [:create, :update]
  end

  resources :photos, concerns: :votable do
    resources :comments, concerns: :votable
  end
  resources :users, only: [:new, :create] #:destroy]

  resources :images

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout
  get 'signup' => 'users#new', as: :signup
  post 'signup' => 'users#create'
end
