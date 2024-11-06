Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/contact'
  get 'pages/schedule'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  #Rails.application.routes.draw do
  root 'pages#about'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'schedule', to: 'pages#schedule'


end
