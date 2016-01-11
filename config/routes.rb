Rails.application.routes.draw do
  devise_for :users
  scope "/admin" do
    resources :users
  end
  
  root to: 'visitors#index'
  get   'about'     => 'static_pages#about'
  get   'products'  => 'static_pages#products'
  get   'dashboard' => 'static_pages#home'
  get   'error_redirect'  => 'errors#redirect'
  get   'contact',  to: 'messages#new', as: 'contact'
  post  'contact',  to: 'messages#create'
  get   'tags/:tag',to: 'articles#index', as: :tag
  
  resources :accounts
  resources :companies
end
