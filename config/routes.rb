Rails.application.routes.draw do
  resources :raids do
    resources :attendances, only: [:create]
  end

  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/sign_up", to: "users#new", as: 'sign_up'

  get "/login", to: "sessions#new", as: 'login'
  post "/login", to: "sessions#create"

  delete "/logout",to: "sessions#destroy"

  root to: "home#index"
end
