Rails.application.routes.draw do
  
  scope module: :public do
    resources :recipes
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    get 'customers/confirm' => 'customers#confirm'
  end

  namespace :admin do
    resources :recipes
    resources :items
    resources :categories, only: [:index, :create, :edit, :update]
  end
  
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
