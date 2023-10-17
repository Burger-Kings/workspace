Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin,skip: [:passwords, :registrations], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get "/" => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:update, :index, :create, :destroy]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :orders, only: [:new, :index, :create, :show]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :addresses, only: [:index, :edit, :create, :update, :destroi]

    get "customers/mypage" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    patch "customers/mypage" => "customers#update"
    get "customers/confirm_withdraw" => "customers#confirm_withdraw"
    patch "customers/withdraw" => "customers#withdraw"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

sss
