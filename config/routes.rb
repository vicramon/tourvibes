Tour::Application.routes.draw do

  resources :houses

  resources :users

  match '/start' => 'home#start'

  match '/login' => 'home#login'
  match '/logout' => 'home#logout'
  match '/register' => 'home#register'
  match '/tour/new' => 'tour#new'
  match '/account' => 'users#account'
  
  match '/tours/' => 'users#my_tours'
  match '/contact' => 'home#contact'
  
  
  #Tour Routes
  match '/tour/:id/edit' => 'tour#edit'
  match '/tour/:id/edit/photos' => 'tour#edit_photos'
  match '/tour/:id/edit/music' => 'tour#edit_music'
  match '/tour/:id/edit/settings' => 'tour#edit_settings'
  match '/tour/:id/preview' => 'tour#preview'
  


  match '/' => 'home#index'
  match '/home' => 'home#index'
  root :to => 'home#index'
 
end
