Rails.application.routes.draw do
  # Public pages (no authentication needed)
  root 'pages#about'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'schedule', to: 'pages#schedule'

  # Devise routes for login, sign up, etc.
  devise_for :users

  # Admin routes (requires authentication and admin privileges)
  namespace :admin do
    get 'dashboard', to: 'admin#dashboard'
  end
end
