Rails.application.routes.draw do
  resources :likes

  resource :session
  get "signin" => "sessions#new"

  resources :users
  get "signup" => "users#new"

  root "events#index"

  resources :events do
    resources :registrations
  end
end
