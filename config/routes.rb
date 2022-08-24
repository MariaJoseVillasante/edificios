Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'api/news'
  get 'api/:date1/:date2',    to: 'api#between_dates'
  resources :blogs
  get 'pages/index'
  get 'inicio/index'
  root 'inicio#index'

  # get 'edificios/index'
  get "edificios",       to: "edificios#index",   as: "list_edificios"
  get 'edificios/new',   to: "edificios#new",     as: "new_edificio"
  get "edificios/:id",   to: "edificios#show",     as: "edificio"
  get "edificios/:id/edit", to: "edificios#edit",  as: "edit_edificio"
  
  post "edificios",      to: "edificios#create"
  patch "edificios/:id", to: "edificios#update"
  put "edificios/:id",   to: "edificios#update" 
  delete "edificios/:id", to: "edificios#destroy",  as: "eliminar_edificio"   
  ###############################
  resources :departamentos
  #Por que agrega esto en la guía
  #################################
  get "clientes",          to: "clientes#index",   as: "clientes"
  get "clientes/new",      to: "clientes#new",     as: "new_cliente"
  get "clientes/:id",      to: "clientes#show",    as: "cliente"
  get "clientes/:id/edit", to: "clientes#edit",    as: "edit_cliente"

  post "clientes",         to: "clientes#create"
  patch "clientes/:id",     to: "clientes#update"
  put "clientes/:id",       to: "clientes#update"
  delete "clientes/:id",    to: "clientes#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "pages/index",        to: "pages#index",      as: "pages"
  get "pages/create",       to: "pages#create",     as: "create_pages"
  get '/pages/dashboard',    to: "pages#dashboard",   as: "dashboard"  
  
  get "posts/index",        to: "posts#index",      as: "posts"
  get "posts/create",       to: "posts#create",     as: "create_posts"
  get '/posts/dashboard',    to: "posts#dashboard",   as: "dashboard_posts"  
  # Defines the root path route ("/")
  # root "articles#index"
end
