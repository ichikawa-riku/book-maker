Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  resources :games, only: [:show, :new, :create] do
    resources :bets, only: [:new, :create]
  end
end
