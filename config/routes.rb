Rails.application.routes.draw do
  devise_for :users
  
  scope "/admin" do
    resources :users
  end
  
  root to: 'static_pages#index'
  get   'about', to: 'static_pages#about'
  get   'products', to: 'static_pages#products'
  get   'dashboard', to: 'static_pages#home'
  get   'error_redirect' , to: 'errors#redirect'
  get   'contact', to: 'messages#new', as: 'contact'
  post  'contact', to: 'messages#create'
  get   'tags/:tag', to: 'articles#index', as: :tag
  
  resources :companies
  resources :comments
  resources :articles
end
