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

  # ユーザー関係
  root 'homes#top'
  get '/about' => 'homes#about'
  resources :post_images do
    resource :favorites, only:[:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :articles, only: [:index, :show]

  # 管理者関係
  namespace :admin do
    root 'homes#top'
    resources :articles
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

end
