Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  # Event and Booking Routes
  resources :events, only: [:create, :index, :update]
  resources :bookings, only: [:create]
  root "events#index"
  get 'meta', to: 'meta#index'
end
