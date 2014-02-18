Tour::Application.routes.draw do

  resources :uploads
  resources :houses
  resources :users

  require 'subdomain'
  require 'customdomain'

  constraints(Subdomain) do
    get '/', to: 'tour#live'
  end

  if Rails.env.production?
    constraints(Customdomain) do
      get '/', to: 'tour#live'
    end
  end

  get '/start', to: 'home#start'
  get '/login', to: 'home#login'
  get '/logout', to: 'home#logout'
  get '/register', to: 'home#register'
  get '/tour/new', to: 'tour#new'
  get '/account', to: 'users#account'

  get '/tours/', to: 'users#my_tours'
  get '/contact', to: 'home#contact'

  #Admin Routes
  get '/admin', to: 'admin#index'
  get '/admin/make_admin/:id', to: 'admin#make_admin'

  #Home Page Routes
  get '/', to: 'home#index'
  get '/home', to: 'home#index'
  get '/home/:page_action', to: 'home#index'
  get '/custom_domains', to: 'home#custom_domains'

  #Payment Routes
  get '/payments/charge/', to: 'payments#charge'
  get '/payments/charge/new', to: 'payments#charge_new'
  get '/payments/charge/existing', to: 'payments#charge_existing'

  #View Tour Routes
  get '/tour/:id/preview', to: 'tour#preview'
 # get '/tour/:id/preview2', to: 'tour#preview_2'

 get '/secure_login/:id', to: 'home#secure_login'

  get '/tour/:id/about', to: 'tour#about'
  get '/tour/:id/map', to: 'tour#map'
  get '/tour/:id/schools', to: 'tour#schools'
  get '/tour/:id/test', to: 'tour#test'
  get '/tour/:id/test_preview', to: 'tour#test_preview'
  get '/tour/:id/not_live', to: 'tour#not_live'
  get '/tour/:id/live', to: 'tour#live'


  #Tour Routes
  get '/tour/first', to: 'users#first_tour'
  get '/tour/:id/edit', to: 'tour#edit'
  get '/tour/:id/edit/photos', to: 'tour#edit_photos'
  get '/tour/:id/edit/music', to: 'tour#edit_music'
  get '/tour/:id/edit/settings', to: 'tour#edit_settings'
  get '/tour/:id/fileupload', to: 'tour#fileupload'
  get '/tour/:id/now_live', to: 'tour#now_live'
  get '/tour/:id/takedown', to: 'tour#takedown'

  #Pay Routes
  get '/tour/:id/publish', to: 'tour#publish'

  root to: 'home#index'

end
