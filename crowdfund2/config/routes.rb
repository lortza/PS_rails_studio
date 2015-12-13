Rails.application.routes.draw do

  resources :categories

  resource :session
  get "signin" => "sessions#new"

  resources :users
  get "signup" => "users#new"

  root  "projects#index"

  get "projects/filter/:filter" => "projects#index", as: :filtered_projects

  resources :projects do
    resources :pledges # nests pledges within projects
    resources :follows
  end #projects

end #routes
