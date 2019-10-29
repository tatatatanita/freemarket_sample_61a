Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update]
  resources :products, only: [:index, :show]
  # 仮でonly: indexにしてます,showも付け足しました。
end