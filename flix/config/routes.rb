Rails.application.routes.draw do
  
  #verb "url" => "controller#action"
  get "movies" => "movies#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'movies#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  
end #application
