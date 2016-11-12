Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

  get '/spots/new', to: 'spots#new'
  post '/spots/new', to: 'spots#new'

  post '/spots/create', to: 'spots#create'

  get '/spots', to: 'spots#show'
end
