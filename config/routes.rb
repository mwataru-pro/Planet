Rails.application.routes.draw do

  # ログイン関係
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  # ユーザー関係
  root 'homes#top'
  get '/about' => 'homes#about'
  resources :post_images do
    resource :favorites, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    member do
      get :following, :followers
    end
  end
  resources :articles, only: [:index, :show]

  resources :relationships, only: [:create,:destroy]
  # 管理者関係
  namespace :admin do
    root 'homes#top'
    resources :articles
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

end
