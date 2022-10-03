Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  # get 'post/index'
  # get 'user/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
