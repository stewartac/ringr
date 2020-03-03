Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games, except: [:new, :create] do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update]

  # new and create game methods nested within host team
  resources :teams, except: [:index] do
    resources :games, only: [:new, :create]
  end

  resources :bookings, only: [:show]

end
