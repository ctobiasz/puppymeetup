Rails.application.routes.draw do

# Serve websocket cable requests in-process
 mount ActionCable.server => '/cable'

 # root 'pages#home'
 root 'pages#home'

resources :posts
resources :locations
resources :messages, only:[:create]
resources :sessions, only:[:new, :destroy, :create]

resources :users do
  resources :chats, only: [:index, :show, :create]
end


  get '/signup', to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'





end
