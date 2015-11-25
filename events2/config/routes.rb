Rails.application.routes.draw do
  resources :users

  get "signup" => "users#new"

  root "events#index"

  resources :events do
    resources :registrations
  end
end
