Rails.application.routes.draw do
  resources :groups do
    resources :certs
  end

  resources :certs do
    resources :claimants
  end

  resources :users

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out
end
