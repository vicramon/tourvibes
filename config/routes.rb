require_relative '../lib/constraints/custom_domain_constraint'
require_relative '../lib/constraints/subdomain_constraint'
require_relative '../lib/constraints/live_domain_constraint'

TourVibes::Application.routes.draw do

  get '/', to: 'tours#live', constraints: Constraint::LiveDomain.new

  resources :sessions, only: [:new, :create, :destroy]

  resources :tours, only: [:index, :new, :create] do
    resource :property_info, only: [:show, :update]
    resource :music, only: [:show, :update]
    resource :settings, only: [:show, :update]
    resource :photos, only: [:show, :update]
    resource :preview, only: :show
    resource :publish, only: [:show, :create]

    get 'edit', to: 'property_infos#show', as: 'edit'
    get 'not_live', to: 'tours#not_live', as: 'not_live'
    get 'live', to: 'tours#live', as: 'live'
    get 'now_live', to: 'tours#now_live', as: 'now_live'
    get 'takedown', to: 'tours#takedown', as: 'takedown'
  end

  resources :uploads, only: [:create, :show]
  resources :sign_ups, only: [:new, :create]

  resources :users, only: [:update]
  get 'account', to: 'users#edit', as: 'account'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'contact', to: 'home#contact', as: 'contact'
  get 'custom_domains', to: 'home#custom_domains'

  resources :payments, only: [:new, :create, :update]

  # get '/tours/:id/preview2', to: 'tours#preview_2'

  get '/secure_login/:id', to: 'home#secure_login'

  # view tour routes
  get '/tours/:id/about', to: 'tours#about'
  get '/tours/:id/map', to: 'tours#map'
  get '/tours/:id/schools', to: 'tours#schools'

  root to: 'home#index'
  get 'about', to: 'home#about', as: 'about'
  get 'home', to: 'home#index', as: 'home'

end
