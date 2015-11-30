Rails.application.routes.draw do

  resource :session
  get "signin" => "sessions#new"

  resources :users
  get "signup" => "users#new"

  root  "projects#index"

  resources :projects do
    resources :pledges # nests pledges within projects
  end #projects

end #routes
