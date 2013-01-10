Tour::Application.routes.draw do

  resources :users

  match '/start' => 'home#start'

  match '/login' => 'home#login'
  match '/logout' => 'home#logout'
  match '/register' => 'home#register'
  match '/tour/new' => 'tour#new'
  match '/account' => 'users#account'

  match '/' => 'home#index'
  match '/home' => 'home#index'
  root :to => 'home#index'
 
end
