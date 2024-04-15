Rails.application.routes.draw do
  resources :events
  resources :members
  resources :meeting_minutes

  resources :organizations do
    # Define routes for new tasks within organizations
    resources :tasks, only: [:new, :create]
    
    # Existing routes for meeting_minutes, members, events, and tasks
    get "meeting_minutes", on: :member
    get "members", on: :member
    get "tasks", on: :member
    get "events", on: :member
    resources :meeting_minutes
    resources :events
    resources :members
    resources :tasks do
      put :start, on: :member
      put :complete, on: :member
    end
  end
  
  devise_for :users

  root "home#index"
end

