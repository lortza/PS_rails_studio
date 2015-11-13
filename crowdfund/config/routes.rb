Rails.application.routes.draw do

  root  "projects#index"

  resources :projects do
    resources :pledges # nests pledges within projects
  end #projects

end #routes
