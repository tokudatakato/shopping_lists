Rails.application.routes.draw do
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  #ゲストログイン
  devise_scope :customer do
    post 'customers/guest_log_in', to: 'public/sessions#guest_log_in'
  end
  
  namespace :public do
    get 'relationship/followings'
    get 'relationship/followers'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:passwords], controllers: {
    sessions: "admin/sessions",
    registrations: "admin/registrations"
  }

  scope module: :public do
    root to: "homes#top"
    
    # 検索機能
    get 'items/search' => 'items#search'
    post 'items/search' => 'list_items#create'
    get 'recipes/search' => 'recipes#search'
    
    # コメント機能
    resources :comments, only: [:create, :destroy]
    
    get 'customers/confirm' => 'customers#confirm'
    
    resources :customers, only: [:index, :show, :edit, :update, :destroy] do
      member do
        get :likes
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    
    resources :recipes do
      resource :likes, only: [:create, :destroy]
    end
    resources :items, only: [:index, :show]
    get 'customers/confirm' => 'customers#confirm'
    resources :categories, only: [:index, :show]
    resources :lists, only: [:index, :create, :show, :destroy]
    get '/recipe/hashtag/:label_name', to: 'hashtags#index'
    # list_item destory
    
    resources :list_items, only: [:create, :destroy] do
      collection do
        delete :destroy_all
      end
    end
    # get 'customers/list_item/:id' => 'list_items#destroy'
    # get 'customers/lists/:id/list_item' => 'lists#item_destroy', as: 'destroy_list_item'
  end

  namespace :admin do
    # 検索機能
    get 'items/search' => 'items#search'
    get 'recipes/search' => 'recipes#search'
    
    resources :recipes
    resources :items
    resources :categories, only: [:index, :show, :create, :edit, :update]
    resources :customers, only: [:index, :show, :destroy] do
      member do
        get :likes
      end
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :comments, only: [:destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

