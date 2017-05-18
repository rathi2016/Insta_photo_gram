Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :sessions
  resources :users do
    resources :posts, only: [:index, :show, :edit, :update]
  end

  get  '/home',   to: 'static_pages#home'
  get  'static_pages/help'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  root 'static_pages#home'
end
