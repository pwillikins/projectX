Rails.application.routes.draw do

  root "sessions#new"

  get "/index", to: "welcome#index"

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

  resources :reset_passwords

  get '/reset_password/:token', to: 'reset_passwords#edit', as: :edit_password
  patch '/reset_password/:token', to: 'reset_passwords#update', as: :update_password

  get "/votes_for_past_shows", to: "gigs#votes_for_past_shows"

  get "/songs_voted_for_by_gig", to: "gigs#songs_voted_for_by_gig"

end
