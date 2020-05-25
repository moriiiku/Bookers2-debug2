Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books

  # post 'users/:id'

  root 'home#top'
  get 'home/about' => 'home#about'
end