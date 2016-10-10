Rails.application.routes.draw do
  namespace :search do
    resources :spaces
    root to: "spaces#index"
  end

  root "venues#index"
  devise_for :admins
  devise_for :users

  resources :venues
end
