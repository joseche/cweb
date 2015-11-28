Rails.application.routes.draw do

  # web routes
  root 'home#index'

  resources :users
  resources :sessions

  get 'signup',   to: 'users#new',        as: 'signup'
  get 'login',    to: 'sessions#new',     as: 'login'
  get 'logout',   to: 'sessions#destroy', as: 'logout'
  get 'settings', to: 'users#settings',   as: 'settings'

  get 'activate/:id/:key', to: 'users#activate',   as: 'activate_user'

  get 'dashboard',            to: 'dashboard#index',        as: 'dashboard'
  get 'dashboard/servers',    to: 'dashboard#servers',      as: 'dashboard_servers'
  get 'dashboard/tags',       to: 'dashboard#tags',         as: 'dashboard_tags'
  get 'dashboard/firsttime',  to: 'dashboard#firsttime',    as: 'dashboard_firsttime'

  get 'about',    to: 'about#index',      as: 'about'

  get 'install',  to: 'install#index',    as: 'install'

  # api routes
  post    'api',                to: 'api#index',        as: 'api'
  put     'api/host_register',  to: 'api#host_register',as: 'api_host_register'
  post    'api/host_settags',   to: 'api#host_settags', as: 'api_host_settags'
  post    'api/host_gettags',   to: 'api#host_gettags', as: 'api_host_gettags'
  post    'api/host_collect',   to: 'api#host_collect', as: 'api_host_collect'

end
