TourVibes::Application.routes.draw do

  # constraints Constraint::LiveDomain.new do
  #   get '/', to: 'live_tours#index'
  #   get 'not_found', to: 'live_tours#not_found', as: 'not_found'
  # end

  resources :uploads, only: [:create, :show, :destroy]
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
    resource :publish, only: [:show, :create, :update]

    get 'edit', to: 'property_infos#show', as: 'edit'
    get 'live', to: 'tours#live', as: 'live'
    get 'now_live', to: 'publishes#now_live', as: 'now_live'
    get 'takedown', to: 'tours#takedown', as: 'takedown'

    resource :map, only: :show
    resource :realtor, only: :show
  end

  get 'account', to: 'users#edit', as: 'account'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'secure_login/:login_hash/:tour_id', to: 'sessions#secure_login'

  get 'first_tour', to: 'users#first_tour', as: 'first_tour'
  patch 'first_tour_submit', to: 'users#first_tour_submit', as: 'first_tour_submit'

  get 'home', to: 'home#index', as: 'home'
  get 'about', to: 'home#about', as: 'about'
  get 'contact', to: 'home#contact', as: 'contact'
  get 'custom_domains', to: 'home#custom_domains', as: 'custom_domains'

  root to: 'home#index'
end
