Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update]

  resources :teams, except: [:index]

  resources :bookings, only: [:show]

end
