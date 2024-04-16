Rails.application.routes.draw do
  # Define resources for top-level models
  resources :events
  resources :members

  # Define nested resources for organizations
  resources :organizations do
    resources :tasks, only: [:new, :create, :index] do
      member do
        put :start
        put :complete
      end
    end

    resources :members # Add nested resources for members within organizations

    member do
      get :meeting_minutes
      get :members
      get :events
    end

    resources :events # Define routes for events associated with organizations
    resources :meeting_minutes # Define routes for meeting minutes associated with organizations
  end
  
  # Devise routes for user authentication
  devise_for :users

  # Define root route
  root "home#index"
end
