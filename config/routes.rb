Rails.application.routes.draw do
  get '/health_check', to: 'health_checks#show'
  root to: 'videos#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :password_resets, only: %i[new create edit update]
  resources :teams

  resource :profile, only: %i[show edit update] do
    collection do
      get :bookmarks
    end
  end

  resources :videos do
    resources :comments, module: :videos
    resource :like, only: %i[create destroy], module: :videos
    resource :bookmark, only: %i[create destroy], module: :videos
  end
end
