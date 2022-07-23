Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/login', to: 'auth#login', default: {:format => :json}
  post '/signup', to: 'auth#signup', default: {:format => :json}
  post '/logout', to: 'auth#logout', default: {:format => :json}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  resources :posts, only: %i[new create destroy] do
    resources :comments, only: %i[new create destroy]
    resources :likes, only: %i[create destroy]
  end

  # Defines the root path route ("/")
  root "users#index"
  
  scope 'api' do
    get '/posts/:id/comments' => 'api/comments#index', as: :api_post_comments
    post '/posts/:id/comments' => 'api/comments#create', as: :api_post_comments_create
    resources :users, only: [] do
      get '/posts' => 'api/posts#index', as: :api_user_posts
    end
  end
end
