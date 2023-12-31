Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root to: 'videos#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  post '/guest_login', to: 'user_sessions#guest_login'

  get '/about', to: 'static_pages#about'
  get '/privacy', to: 'static_pages#privacy'
  get '/term', to: 'static_pages#term'

  resources :password_resets, only: %i[new create edit update]
  resources :teams, only: [:index, :show]

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

  # 管理者用
  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :users, only: %i[index destroy]
    resources :teams
    resources :videos, only: %i[index new destroy]
    resources :comments, only: %i[index destroy]
  end
end
