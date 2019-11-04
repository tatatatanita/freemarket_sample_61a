Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :users, only: [:show, :edit, :update] 
  resources :products do
    member do
      get :show_exhibit
    end
  end
end