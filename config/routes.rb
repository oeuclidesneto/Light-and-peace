Rails.application.routes.draw do
  get 'events/index'
  # Static Pages
  root "pages#home"
  get "/about", to: "pages#about"
  get "/contact", to: "contacts#new"  # Contact Form Page
  post "/contact", to: "contacts#create"  # Contact Form Submission
  get "/schedule", to: "pages#schedule"
  get "/services", to: "services#index"
  get "/thank-you", to: "contacts#thank_you"
  get 'events', to: 'events#index'

  resources :services, only: [:index, :show]

  # Devise Authentication Routes
  devise_for :users

  # Admin Routes
  namespace :admin do
    get "/dashboard", to: "admin#dashboard"
    resources :posts
  end
end
