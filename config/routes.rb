Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, ->(user) { user.is_manager? } do
    mount Sidekiq::Web => '/sidekiq'
  end

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

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
