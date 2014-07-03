Rails.application.routes.draw do

  root "welcome#index"

  resources :users, :only => [:new, :create]

  resources :sessions, :only => [:destroy, :create, :new]

  post "/sessions/new", to: "sessions#new"

  get "/logout", to: "sessions#destroy"

  get "/gigs", to: "gigs#index"

  get "/votes/new", to: "votes#new"

  post "/votes/new", to: "votes#new"

  post "/votes", to: "votes#create"

  get "/votes_for_user", to: "votes#votes_for_user"

  get "/votes_for_gig", to: "votes#votes_for_gig"

end
