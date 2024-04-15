Rails.application.routes.draw do
  # Define resources for top-level models
  resources :events
  resources :members
  resources :meeting_minutes

  # Define nested resources for organizations
  resources :organizations do
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

    resources :events
  end
  

  # Devise routes for user authentication
  devise_for :users

  # Define root route
  root "home#index"
end
