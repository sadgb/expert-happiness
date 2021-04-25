Rails.application.routes.draw do
  post 'friend_requests/add'
  post 'friend_requests/remove'

  root to: 'visitors#index'

  get '/users/search', to: 'users#search', as: :search_users

  get '/signin_page', to: 'users#signin_page', as: :signin_page
  post '/signin', to: 'users#signin', as: :signin

  get '/signup_page', to: 'users#signup_page', as: :signup_page
  post '/signup', to: 'users#signup', as: :signup

  delete '/signout', to: 'users#signout', as: :signout


  resources :users
  resources :posts
end
