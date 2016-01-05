Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :users_admin, :controller => 'users'
  
  root to: 'visitors#index'
  get   'about'     => 'static_pages#about'
  get   'products'  => 'static_pages#products'
  get   'dashboard' => 'static_pages#home'
  get   'error_redirect'  => 'errors#redirect'
  get   'contact',  to: 'messages#new', as: 'contact'
  post  'contact',  to: 'messages#create'
  get   'tags/:tag',to: 'articles#index', as: :tag
  post 'create_user' => 'users#create', as: :create_user
  
  resources :accounts
  resources :companies
end
