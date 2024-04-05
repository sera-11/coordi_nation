Rails.application.routes.draw do
  resources :members
  resources :tasks
  resources :meeting_minutes
  resources :organizations
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"
end
