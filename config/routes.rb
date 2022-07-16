Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: %i[new create] do
    resources :comments, only: %i[new create]
    resources :likes, only: %i[create destroy]
  end

  root 'users#index'
  # Defines the root path route ("/")
end
