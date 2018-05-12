Rails.application.routes.draw do

# root of application
  root to: 'articles#index'

# resources for articles, tags, authors, etc.
  resources :articles do
    resources :comments
  end

  resources :tags

  resources :authors

# resources for authentication
  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'

end
