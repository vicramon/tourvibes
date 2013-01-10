Tour::Application.routes.draw do

  resources :houses

  resources :users

  match '/start' => 'home#start'

  match '/login' => 'home#login'
  match '/logout' => 'home#logout'
  match '/register' => 'home#register'
  match '/tour/new' => 'tour#new'
  match '/account' => 'users#account'
  match '/tour/:id/edit' => 'tour#edit'
  
  match '/tours/' => 'users#my_tours'
  match '/contact' => 'home#contact'

  match '/' => 'home#index'
  match '/home' => 'home#index'
  root :to => 'home#index'
 
end
