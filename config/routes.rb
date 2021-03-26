Rails.application.routes.draw do
  resources :users
  root to: 'visitors#index'

  get '/signin_page', to: 'users#signin_page', as: :signin_page
  post '/signin', to: 'users#signin', as: :signin

  get '/signup_page', to: 'users#signup_page', as: :signup_page
  post '/signup', to: 'users#signup', as: :signup
end
