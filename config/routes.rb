Rails.application.routes.draw do
  resources :mades
  get 'made/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :messages
  resources :users
  get '/signup',  to:'users#new'
  post '/signup', to:'users#create'
  get 'home/home'
  get '/login', 		to: 'sessions#new'     
  post '/login', 		to: 'sessions#create'
  delete '/logout', 		to: 'sessions#destroy'
  root "home#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
