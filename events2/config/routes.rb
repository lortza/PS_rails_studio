Rails.application.routes.draw do
  
  resource :session
  get "signin" => "sessions#new"

  resources :users
  get "signup" => "users#new"

  root "events#index"

  resources :events do
    resources :registrations
    resources :likes
  end
end
