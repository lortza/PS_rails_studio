Rails.application.routes.draw do
  
  resources :genres

  resource :session
  get "signin" => "sessions#new"

  resources :users
  get "signup" => "users#new"

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies

  root "movies#index"
  resources :movies do
    resources :reviews
    resources :favorites
  end #movies
  
end #Routes
