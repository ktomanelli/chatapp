Rails.application.routes.draw do
  root 'sessions#home', as: 'home'
  resources :reactions
  resources :replies
  resources :chatrooms
  resources :messages
  resources :users

  # get '/', to: 'sessions#home', as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  post '/chatrooms/:id', to: 'messages#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
