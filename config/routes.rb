Rails.application.routes.draw do
  get 'services/index'
  # Public pages (no authentication needed)
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'schedule', to: 'pages#schedule'

  # Devise routes for login, sign up, etc.
  devise_for :users

  # Admin routes (requires authentication and admin privileges)
  # Direct route for /dashboard, handled by Admin::AdminController
  get 'dashboard', to: 'admin/admin#dashboard', as: :admin_dashboard

  # Admin namespace for other admin routes
  namespace :admin do
    resources :posts
  end
end
