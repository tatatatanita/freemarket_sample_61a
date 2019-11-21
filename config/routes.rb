Rails.application.routes.draw do
  resources :purchase, only: [:show] do
    collection do
      post 'pay/:id', to: 'purchase#pay'
      get 'done/:id', to: 'purchase#done'
      get 'update/:id', to: 'purchase#update'
    end
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
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

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update] do
    get 'users/:name', controller: 'users', action: 'edit'
    member do
      get :show_exhibit
      get :logout
      get :show_bought
    end
  end
  resources :products do
    collection do
      get :search
    end
    member do
      get :buyer_show
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    # 今後実装予定
    # member do
    #   get 'image_destroy', defaults: { format: 'json' }
    # end
  end
end