require_relative '../lib/constraints/custom_domain_constraint'
require_relative '../lib/constraints/subdomain_constraint'

TourVibes::Application.routes.draw do

  get '/', to: 'tours#live', constraints: Constraint::Subdomain.new
  get '/', to: 'tours#live', constraints: Constraint::CustomDomain.new

  resources :sessions, only: [:new, :create, :destroy]
  resources :tours, only: [:index, :edit]

  resources :sign_ups, only: [:new, :create]

  get 'start', to: 'home#start', as: 'start'

  get '/logout', to: 'home#logout'
  get '/tours/new', to: 'tours#new'
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

  #View tours Routes
  get '/tours/:id/preview', to: 'tours#preview'
 # get '/tours/:id/preview2', to: 'tours#preview_2'

 get '/secure_login/:id', to: 'home#secure_login'

  get '/tours/:id/about', to: 'tours#about'
  get '/tours/:id/map', to: 'tours#map'
  get '/tours/:id/schools', to: 'tours#schools'
  get '/tours/:id/test', to: 'tours#test'
  get '/tours/:id/test_preview', to: 'tours#test_preview'
  get '/tours/:id/not_live', to: 'tours#not_live'
  get '/tours/:id/live', to: 'tours#live'


  #tours Routes
  get '/tours/first', to: 'users#first_tours'
  get '/tours/:id/edit', to: 'tours#edit'
  get '/tours/:id/edit/photos', to: 'tours#edit_photos'
  get '/tours/:id/edit/music', to: 'tours#edit_music'
  get '/tours/:id/edit/settings', to: 'tours#edit_settings'
  get '/tours/:id/fileupload', to: 'tours#fileupload'
  get '/tours/:id/now_live', to: 'tours#now_live', as: 'now_live'
  get '/tours/:id/takedown', to: 'tours#takedown'

  #Pay Routes
  get '/tours/:id/publish', to: 'tours#publish'

  root to: 'home#index'

end
