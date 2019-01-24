Rails.application.routes.draw do

root 'pages#home'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

resources :sessions
resources :users
resources :posts

get '/signup', to: 'users#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
