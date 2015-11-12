Rails.application.routes.draw do
  resources :pledges

  root  "projects#index"
  resources :projects
end
