Rails.application.routes.draw do
  get 'quarterly_reports/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
  get 'quarterly-reports', to: 'quarterly_reports#index', as: :quarterly_reports
  get 'quarterly-reports/:slug', to: 'quarterly_reports#show', as: :quarterly_report


  resources :services, only: [:index, :show]



  # Devise Authentication Routes
  devise_for :users

  # Admin Routes
  namespace :admin do
    get "/dashboard", to: "admin#dashboard"
    resources :posts
  end
end
