Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  resource :session

  resources :users
  get "signup" => "users#new"

  root "movies#index"
  resources :movies do
    resources :reviews
  end #movies
  
end #Routes
