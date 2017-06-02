Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end

  resources :sessions, only: [:show, :destroy]
  resources :users, only: [:index, :edit, :show, :destoy] do
    resources :posts, only: [:index, :show, :edit, :update]
  end

  get  '/home',   to: 'static_pages#home'
  get  '/signup',  to: 'users#new'
  get   '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'

  root 'static_pages#home'
end
