Rails.application.routes.draw do
  
  resources :genres

  resource :session
  get "signin" => "sessions#new"

  resources :users
  get "signup" => "users#new"

  root "movies#index"
  resources :movies do
    resources :reviews
    resources :favorites
  end #movies
  
end #Routes
