Rails.application.routes.draw do
  resources :events
  resources :members
  resources :tasks
  resources :meeting_minutes

  resources :organizations do
    get "meeting_minutes", on: :member
    get "members", on: :member
    get "tasks", on: :member
    get "events", on: :member
    resources :meeting_minutes
    resources :events
    resources :members
    resources :tasks do
      put :start, on: :member
      
    end
  end
  

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"
end
