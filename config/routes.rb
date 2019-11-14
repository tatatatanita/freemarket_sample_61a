Rails.application.routes.draw do
  devise_for :users
  resources :signup, except: [:index, :show] do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      post 'create',to:'signup#create'
      get 'done' 
    end
  end
  # resources :cards , only: [:new, :index, :create, :destroy]
  
  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update] do
    get 'users/:name', controller: 'users', action: 'edit'
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