Rails.application.routes.draw do
  resource :session

  resources :users
  get "signup" => "users#new"

  root "events#index"

  resources :events do
    resources :registrations
  end
end
