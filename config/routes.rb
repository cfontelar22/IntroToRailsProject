Rails.application.routes.draw do
  get 'categories/show'
  root 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'search', to: 'application#search'
  resources :books, only: [:index, :show] 
  resources :library_branches, only: [:show]
  end
