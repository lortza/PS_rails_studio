Rails.application.routes.draw do
  resource :session
  get "signin" => "session#new"

  resources :users
  get "signup" => "users#new"

  root "events#index"

  resources :events do
    resources :registrations
  end
end
