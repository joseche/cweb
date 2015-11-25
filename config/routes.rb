Rails.application.routes.draw do

  resources :users
  resources :sessions

  root 'home#index'

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


end
