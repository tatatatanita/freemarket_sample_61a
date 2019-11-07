Rails.application.routes.draw do
  devise_for :users
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      get 'done' 
    end
  end

  
  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update]
  resources :products, only: [:index]
  # 仮でonly: indexにしてます
end