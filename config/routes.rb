Rails.application.routes.draw do
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users, controllers: { registrations: 'users/registrations' }
  #resources :users, :controller => 'users'
  
  root to: 'visitors#index'
  get   'about'     => 'static_pages#about'
  get   'products'  => 'static_pages#products'
  get   'dashboard' => 'static_pages#home'
  get   'error_redirect'  => 'errors#redirect'
  get   'contact',  to: 'messages#new', as: 'contact'
  post  'contact',  to: 'messages#create'
  get   'tags/:tag',to: 'articles#index', as: :tag
  #post 'create_user' => 'users#create', as: :create_user
  
  resources :accounts
  resources :companies
end
