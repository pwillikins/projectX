Rails.application.routes.draw do

  root "welcome#index"

  resources :users, :only => [:new, :create]

  resources :sessions, :only => [:destroy, :create, :new]

  post "/sessions/new", to: "sessions#new"

  get "/logout", to: "sessions#destroy"

  get "/gigs", to: "gigs#index"

  get "/songs/new", to: "songs#new"

  post "/songs/new", to: "songs#new"

  post "/songs", to: "songs#create"

  get "/songs/:id", to: "songs#show", as: "show_path"

end
