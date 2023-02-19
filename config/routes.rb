Rails.application.routes.draw do
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :public do
    get 'relationship/followings'
    get 'relationship/followers'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    # 検索機能
    get 'items/search' => 'items#search'
    get 'recipes/search' => 'recipes#search'
    
    # コメント機能
    resources :comments, only: [:create]
    
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
    
    resources :list_items, only: [:destory]
    # get 'customers/list_item/:id' => 'list_items#destroy'
    # get 'customers/lists/:id/list_item' => 'lists#item_destroy', as: 'destroy_list_item'
  end

  namespace :admin do
    resources :recipes
    resources :items
    resources :categories, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :destory]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
