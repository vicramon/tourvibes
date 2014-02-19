require_relative '../lib/constraints/custom_domain_constraint'
require_relative '../lib/constraints/subdomain_constraint'
require_relative '../lib/constraints/live_domain_constraint'

TourVibes::Application.routes.draw do

  get '/', to: 'tours#live', constraints: Constraint::LiveDomain.new

  resources :sessions, only: [:new, :create, :destroy]

  resources :tours, only: [:index, :new, :create] do
    resource :property_info, only: [:show, :update]
    resource :music, only: [:index, :update]
    resource :settings, only: [:index, :update]
    resource :photos, only: [:index, :update]
    resource :preview, only: :index
    resource :publish, only: [:index, :create]
  end

  get '/tours/:id/edit', to: 'property_infos#show'
  get '/tours/:id/not_live', to: 'tours#not_live'
  get '/tours/:id/live', to: 'tours#live'
  get '/tours/:id/now_live', to: 'tours#now_live', as: 'now_live'
  get '/tours/:id/takedown', to: 'tours#takedown'
  get '/tours/:id/publish', to: 'tours#publish'

  resources :sign_ups, only: [:new, :create]

  get 'account', to: 'users#edit', as: 'account'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'contact', to: 'home#contact', as: 'contact'
  get 'custom_domains', to: 'home#custom_domains'

  resources :payments, only: [:new, :create, :update]

  get '/tours/:id/preview', to: 'tours#preview'
  # get '/tours/:id/preview2', to: 'tours#preview_2'

  get '/secure_login/:id', to: 'home#secure_login'

  # view tour routes
  get '/tours/:id/about', to: 'tours#about'
  get '/tours/:id/map', to: 'tours#map'
  get '/tours/:id/schools', to: 'tours#schools'

  root to: 'home#index'

end
