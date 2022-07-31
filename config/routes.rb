Rails.application.routes.draw do
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

  # Defines the root path route ("/")
  # root "articles#index"
end
