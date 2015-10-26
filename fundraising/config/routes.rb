Rails.application.routes.draw do
  # get "projects" => "projects#index"
  # get "projects/:id" => "projects#show", as: "project"
  # get "projects/:id/edit" => "projects#edit", as: "edit_project"
  # patch "projects/:id" => "projects#update"
  
  root 'projects#index'
  resources :projects
end
