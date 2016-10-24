Rails.application.routes.draw do
  get "static_pages/index"

  namespace :search do
    resources :spaces
    root to: "spaces#index"
  end

  root "static_pages#index"
  devise_for :admins
  devise_for :users

  resources :bookings
  resources :orders
  resources :venues do
    resources :venue_amenities
    resources :amenities do
      resources :service_charges
    end
  end

  resources :static_pages
end
