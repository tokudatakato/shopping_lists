Rails.application.routes.draw do
  


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
  end

  namespace :admin do
    resources :recipes
    resources :items
    resources :categories, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :destory]
  end
  
      # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
