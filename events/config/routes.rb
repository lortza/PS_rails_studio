Rails.application.routes.draw do
  #verb "url pattern" => "controller#method", as: linkhelpername
  # get "events" => "events#index"
  # get "events/:id" => "events#show", as: "event"
  # get "events/:id/edit" => "events#edit", as: "edit_event"
  # patch "events/:id" => "events#update"
  #root 'events#index'
  resources :events
  root 'events#index'
end
