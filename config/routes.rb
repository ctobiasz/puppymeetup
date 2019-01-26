Rails.application.routes.draw do

  get 'locations/new'
  get 'locations/index'
  get 'locations/show'
  get 'locations/edit'
# root 'pages#home'
root 'sessions#new'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

resources :sessions
resources :users
resources :posts

get '/signup', to: 'users#new'


end
