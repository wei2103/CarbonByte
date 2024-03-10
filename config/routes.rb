# config/routes.rb

Rails.application.routes.draw do
    get '/education/educational_content', to: 'education#educational_content', as: 'educational_content'
    get '/education/new', to: 'education#new', as: 'new'
    resources :contents, only: [:new, :create]
    devise_for :users
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
    # Defines the root path route ("/")
    root "dashboard#index"
  end
  