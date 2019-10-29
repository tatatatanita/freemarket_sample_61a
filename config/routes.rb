Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#show"  # user機能作成のための仮置き
  resources :users, only: [:show, :edit, :update]
end