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
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
