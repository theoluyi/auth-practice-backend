Rails.application.routes.draw do
  resources :snacks, only: [:index]
  
  # this is route to register user
  resources :users, only: [:create]

  post '/login', to: 'users#login'

  # this is the route to persist a user
  get '/persist', to: 'users#persist'
end
