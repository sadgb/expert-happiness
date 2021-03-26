Rails.application.routes.draw do
  root to: 'visitors#index'

  match '/signin', to: 'users#signin', as: :signin, via: [:get, :post]
  match '/signup', to: 'users#signup', as: :signup, via: [:get, :post]
end
