Rails.application.routes.draw do
  # Define resources for top-level models
  resources :events

  # Define nested resources for organizations
  resources :organizations do
    resources :meeting_minutes 
    resources :events # Define routes for events associated with organizations
    resources :members 

    resources :tasks, only: [:new, :create, :index] do
      member do
        put :start
        put :complete
      end
    end

    member do
      get :meeting_minutes
      get :members
      get :events
    end

    resources :meeting_minutes, only: [:index, :new, :create]  # adjust the actions as needed
  end
  
  # Devise routes for user authentication
  devise_for :users

  # Define root route
  root "home#index"
end
