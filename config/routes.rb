Tour::Application.routes.draw do

  resources :uploads
  resources :houses
  resources :users
  
  require 'subdomain'
  require 'customdomain'
  
  
  # Subdomains
  constraints(Subdomain) do  
    match '/' => 'tour#preview'
  end
  
  if Rails.env.production?
    # Custom Domains
    constraints(Customdomain) do  
      match '/' => 'tour#preview'
    end
  end

  match '/start' => 'home#start'

  match '/login' => 'home#login'
  match '/logout' => 'home#logout'
  match '/register' => 'home#register'
  match '/tour/new' => 'tour#new'
  match '/account' => 'users#account'
  
  match '/tours/' => 'users#my_tours'
  match '/contact' => 'home#contact'
  
  #Admin Routes
  match '/admin' => 'admin#index'
  match '/admin/make_admin/:id' => 'admin#make_admin'
  
  #Home Page Routes
  match '/' => 'home#index'
  match '/home' => 'home#index'
  match '/home/:page_action' => 'home#index'
  match '/custom_domains' => 'home#custom_domains'
  
  #Payment Routes
  match '/payments/charge/' => 'payments#charge'
  match '/payments/charge/new' => 'payments#charge_new'
  match '/payments/charge/existing' => 'payments#charge_existing'
  
  #View Tour Routes
  match '/tour/:id/preview' => 'tour#preview'
  match '/tour/:id/about' => 'tour#about'
  match '/tour/:id/map' => 'tour#map'
  match '/tour/:id/schools' => 'tour#schools'
  
  match '/tour/:id/test' => 'tour#test'
  
  #Tour Routes
  match '/tour/:id/edit' => 'tour#edit'
  match '/tour/:id/edit/photos' => 'tour#edit_photos'
  match '/tour/:id/edit/music' => 'tour#edit_music'
  match '/tour/:id/edit/settings' => 'tour#edit_settings'
  match '/tour/:id/fileupload' => 'tour#fileupload'
  match '/tour/:id/now_live' => 'tour#now_live'
  match '/tour/:id/takedown' => 'tour#takedown'
  
  #Pay Routes
  match '/tour/:id/publish' => 'tour#publish'
  


  
  root :to => 'home#index'
 
end
