Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "users#index"

  get 'users', to: 'users#index'
  get 'users/show/:id', to: 'users#show'  
  get 'users/new', to: 'users#new'

  get 'articles', to: 'articles#index'
  get 'articles/show/:id', to: 'articles#show'
  get 'articles/new', to: 'articles#new'

  resources :users do
    resources :articles
  end

  resources :articles do
    resources :comments
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
