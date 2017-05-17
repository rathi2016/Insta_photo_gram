Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  root 'users#new'
end
