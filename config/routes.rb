Rails.application.routes.draw do
  namespace :api do
    resources :users do
      member do
        get '/whereami', to: 'user#index'
      end
    end
  end
end
