Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => "homes#about", as: 'about'

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  get 'books/index' => "books#index"
  get 'users/index' => "users#index"
end
