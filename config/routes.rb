Rails.application.routes.draw do
  devise_for :users
  
  root to: 'visitors#index'
  get   'about'     => 'static_pages#about'
  get   'products'  => 'static_pages#products'
  get   'dashboard' => 'static_pages#dashboard'
  get   'contact',  to: 'messages#new', as: 'contact'
  post  'contact',  to: 'messages#create'
  get   'tags/:tag',to: 'articles#index', as: :tag
  
  resources :users
  resources :users_admin, :controller => 'users'
  resources :accounts
end
