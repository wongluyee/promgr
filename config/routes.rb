Rails.application.routes.draw do
  devise_for :users
  root to: "users#dashboard"

  resources :users, only: [:index, :show] do
    resources :goals, only: [:index, :create]
    resources :timesheets, only: [:index]
    resources :user_tasks, only: [:create] do
      resources :tasks, only: [:create, :update]
    end
  end
  resources :goals, only: [:update]
  resources :tasks, only: [:index, :new, :create, :update, :destroy]
  resources :timesheets, only: [:create, :update]
  get "dashboard", to: "users#dashboard", as: :dashboard

  resources :meetings, only: [:index, :new, :create, :update, :destroy]

  # Remove message pages
  # resources :chatrooms, only: :show do
  #   resources :messages, only: :create
  # end
end
