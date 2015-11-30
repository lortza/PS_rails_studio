Rails.application.routes.draw do

  resources :users
  get "signup" => "users#new"

  root  "projects#index"

  resources :projects do
    resources :pledges # nests pledges within projects
  end #projects

end #routes
