Rails.application.routes.draw do
  get 'activity_types/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"

  resources :user, only: [:show]
  resources :preferences, only: [:create]
  resources :activities, only: [:new, :create]
  resources :activity_types, only: [:show]


  # Go to preferences/new when browse preferences/
  get 'preferences', to: 'preferences#new'
end
