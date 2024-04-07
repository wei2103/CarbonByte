Rails.application.routes.draw do
  get 'goals/index'
  get 'activity_types/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"

  resources :user, only: [:show]
  resources :preferences, only: [:create]
  resources :activities, only: [:new, :create]
  resources :activity_types, only: [:show]
  resources :dashboard, only: [:index]
  get '/education/educational_content', to: 'education#educational_content', as: 'educational_content'
  # get '/education/new', to: 'education#new', as: 'new'
  resources :education, only: [:new, :create]
  resources :goals, only: [:new, :create, :update]
  # Go to preferences/new when browse preferences/
  get 'preferences', to: 'preferences#new'
end