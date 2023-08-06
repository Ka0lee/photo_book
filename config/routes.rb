Rails.application.routes.draw do

  devise_for :users
  root to: 'photographs#index'
  resources :users, only: [:edit, :update]
  resources :photographs, only: [:index, :new, :create, :show]
end
