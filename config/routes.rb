Rails.application.routes.draw do
  devise_for :users
  root to: "users#dashboard"

  resources :users, only: [:index, :show] do
    resources :goals, only: [:index, :create, :update]
    resources :timesheets, only: [:index, :create, :update]
    resources :user_tasks, only: [:create] do
      resources :tasks, only: [:create, :update]
    end
  end
  resources :tasks, only: [:index, :new, :create]
end
