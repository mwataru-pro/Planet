Rails.application.routes.draw do

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

  root 'homes#top'
  get '/about' => 'homes#about'
  resources :post_images
  resources :users, only: [:index, :show, :edit, :update]
  get 'users/index'
  get 'users/show'

  namespace :admin do
    root 'homes#top'
    resources :articles
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end


end
