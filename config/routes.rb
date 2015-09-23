Rails.application.routes.draw do

  root to: "welcome#index"

  resources :users do
    resources :goals
  end

  get "sessions/new", to: "sessions#new", as: "login"

  post "sessions", to: "sessions#create"

  delete "sessions", to: "sessions#destroy"

end
