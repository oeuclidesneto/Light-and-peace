Rails.application.routes.draw do
  get 'donations/index'
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
  get "/thank-you", to: "contacts#thank_you"
  get 'events', to: 'events#index'
  get '/donate', to: 'donations#index', as: :donations
  get 'quarterly-reports', to: 'quarterly_reports#index', as: :quarterly_reports
  get 'quarterly-reports/:slug', to: 'quarterly_reports#show', as: :quarterly_report

  get "/services", to: "services#index"
  get "/services/gospel-at-home", to: "services#gospel_at_home"
  get "/services/study-group", to: "services#study_group"
  get "/services/fraternal-assistance", to: "services#fraternal_assistance"
  get "/services/children-and-youth-group", to: "services#children_and_youth_group"
  get "/services/energy-healing", to: "services#energy_healing"
  get "/services/library", to: "services#library"
  get "/services/lecture", to: "services#lecture"


  # Devise Authentication Routes
  devise_for :users

  # Admin Routes
  namespace :admin do
    get "/dashboard", to: "admin#dashboard"
    resources :posts
  end
end
