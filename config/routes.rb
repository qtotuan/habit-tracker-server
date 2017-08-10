Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :habits

      # put '/api/v1/habits/:id'
      # post '/habits/:id', to: 'habits#update'
    end
  end
end
