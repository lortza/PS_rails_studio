Rails.application.routes.draw do
  
  resources :categories

  resource :session
  get "signin" => "sessions#new"

  resources :users
  get "signup" => "users#new"

  root "events#index"

  get "events/filter/:scope" => "events#index", as: :filtered_events #this route has to be before the nested one
  resources :events do
    resources :registrations
    resources :likes
  end #events
  
end #routes
