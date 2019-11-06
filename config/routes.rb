Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :users, only: [:show, :edit, :update] do
    member do
      get :show_exhibit
    end
  end
  resources :products do
    member do
      get :buyer_show
    end
  end
end