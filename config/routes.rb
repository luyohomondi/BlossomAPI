Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get 'plants', to: 'plants#index' 
  # get 'flowers', to: 'flowers#index'
  resources :plants
  resources :flowers
  resources :sellers, only: [:index,:show]
  resources :users,only: [:index,:show]
  resources :profiles, only: [:index,:show]
  resources :sellerprofiles, only: [:index,:show]


  post '/signupseller', to: 'sellers#create'
  post '/signup', to: 'users#create'
   

  #Login and Logout of User Functions to be handled in the sessions
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"
  get "/me", to: "users#showme"

  #Login and Logout of Seller to be handled in Session controller

  post '/loginseller', to: 'sessions#createseller'
  delete '/logoutseller', to: 'sessions#destroyseller'
     
end
