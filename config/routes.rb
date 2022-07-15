Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create]
  end
  devise_for :users
  resources :users
  resources :books
  resources :places
  root to: 'places#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "homes#index"
end
