Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  namespace :admin do
    get 'users/index'
    get 'users/show'
  end
  get 'post_images/index'
  get 'post_images/show'
  get 'post_images/new'
  get 'users/index'
  get 'users/show'
  namespace :admin do
    get 'articles/index'
    get 'articles/show'
    get 'articles/new'
  end
  namespace :admin do
    get 'homes/top'
  end
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
end
