Rails.application.routes.draw do
  devise_for :users
  root :to => 'groups#index'

  resources :groups do
    resources :certs, :shallow => true do
      resources :claimants, :shallow => true
    end
  end

  resources :providers
  resources :refunds
  resources :users

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out
end
