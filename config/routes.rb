Rails.application.routes.draw do
  devise_for :users
  
  scope "/admin" do
    resources :users
  end
  
  root to: 'static_pages#index'
  get   'about'     => 'static_pages#about'
  get   'products'  => 'static_pages#products'
  get   'dashboard' => 'static_pages#home'
  get   'error_redirect' => 'errors#redirect'
  get   'contact'   => 'messages#new', as: 'contact'
  post  'contact'   => 'messages#create'
  get   'tags/:tag' => 'articles#index', as: :tag
  
  resources :companies
  resources :comments
  resources :articles
end
