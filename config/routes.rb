require_relative '../lib/constraints/custom_domain_constraint'
require_relative '../lib/constraints/subdomain_constraint'
require_relative '../lib/constraints/live_domain_constraint'

TourVibes::Application.routes.draw do

  get '/', to: 'tours#live', constraints: Constraint::LiveDomain.new

  resources :uploads, only: [:create, :show]
  resources :sign_ups, only: [:new, :create]
  resources :payments, only: [:new, :create, :update]
  resources :users, only: [:update]
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
    get 'about', to: 'tours#about', as: 'about'
    get 'map', to: 'tours#map', as: 'map'
    get 'schools', to: 'tours#schools', as: 'schools'
  end

  get 'account', to: 'users#edit', as: 'account'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/secure_login/:id', to: 'home#secure_login'

  get 'home', to: 'home#index', as: 'home'
  get 'about', to: 'home#about', as: 'about'
  get 'contact', to: 'home#contact', as: 'contact'
  get 'custom_domains', to: 'home#custom_domains', as: 'custom_domains'

  root to: 'home#index'
end
