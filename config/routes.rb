Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      post '/signup', to: 'users#create'
      get '/me', to: 'auth#show'

      resources :users
      resources :habits
      resources :categories
    end
  end

  get '/', to: 'application#index'
end
