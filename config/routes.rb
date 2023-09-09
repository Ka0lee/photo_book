Rails.application.routes.draw do

  devise_for :users
  root to: 'photographs#index'
  resources :users, only: [:edit, :update]
  resources :photographs do
   collection do
    get 'search'
    get 'category/:id', to: "photographs#category"

   end
  end

end
