Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/new'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
