Rails.application.routes.draw do

  # web routes
  root 'home#index'

  resources :users
  resources :sessions

  get 'signup',     to: 'users#new',        as: 'signup'
  get 'login',      to: 'sessions#new',     as: 'login'
  get 'logout',     to: 'sessions#destroy', as: 'logout'
  get 'settings',   to: 'users#settings',   as: 'settings'

  get 'activate/:id/:key', to: 'users#activate', as: 'activate_user'

  get 'dashboard',              to: 'dashboard#index',      as: 'dashboard'
  get 'dashboard/servers',      to: 'dashboard#servers',    as: 'dashboard_servers'
  get 'dashboard/tags',         to: 'dashboard#tags',       as: 'dashboard_tags'
  get 'dashboard/firsttime',    to: 'dashboard#firsttime',  as: 'dashboard_firsttime'
 
  get 'host',                   to: 'host',                 as: 'host'
  get 'host/:host',             to: 'host#show',            as: 'host_show'

  get 'about', to: 'about#index', as: 'about'

  get 'install', to: 'install#index', as: 'install'

  # api routes
  post 'api',                     to: 'api#index',                      as: 'api'
  put  'api/host_register',       to: 'api#host_register',              as: 'api_host_register'
  post 'api/host_settags',        to: 'api#host_settags',               as: 'api_host_settags'
  post 'api/host_gettags',        to: 'api#host_gettags',               as: 'api_host_gettags'
  post 'api/host/loadavg',        to: 'api#host_collect_loadavg',       as: 'api_host_collect_loadavg'
  post 'api/host/cputime',        to: 'api#host_collect_cputime',       as: 'api_host_collect_cputime'
  post 'api/host/virtualmem',     to: 'api#host_collect_virtualmem',    as: 'api_host_collect_virtualmem'
  post 'api/host/swapmem',        to: 'api#host_collect_swapmem',       as: 'api_host_collect_swapmem'

  get  'api/host/:hostsig/loadavg/:range',   to: 'api#host_get_loadavg',    as: 'api_host_get_loadavg'
  get  'api/host/:hostsig/cputime/:range',   to: 'api#host_get_cputime',    as: 'api_host_get_cputime'
  get  'api/host/:hostsig/virtualmem/:range',to: 'api#host_get_virtualmem', as: 'api_host_get_virtualmem'
  get  'api/host/:hostsig/swapmem/:range',   to: 'api#host_get_swapmem',    as: 'api_host_get_swapmem'

end
