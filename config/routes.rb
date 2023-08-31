Rails.application.routes.draw do

  devise_for :users
  root to: 'photographs#index'
  resources :users, only: [:edit, :update]
  resources :photographs do
   collection do
    get 'search'
   end
  end
end
