Rails.application.routes.draw do
  
  resources :events do
    resources :registrations #this nests registrations within events
  end

  root 'events#index'
  #verb "url pattern" => "controller#method", as: linkhelpername
  # get "events" => "events#index"
  # get "events/:id" => "events#show", as: "event"
  # get "events/:id/edit" => "events#edit", as: "edit_event"
  # patch "events/:id" => "events#update"
  #root 'events#index'
end
