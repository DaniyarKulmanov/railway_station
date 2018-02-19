Rails.application.routes.draw do
  devise_for :users

  resources :coupe_wagons, :econom_wagons, :cb_wagons, :sitting_wagons, controller: 'wagons', type: 'CoupeWagon'
  resource :search, only: [:new, :show, :edit]

  resources :tickets, only: [:new, :show, :create]

  namespace :admin do
    resources :railway_stations do
      patch :update_position, on: :member
    end
    resources :trains do
      resources :wagons, shallow: true
    end

    resources :routes
    resources :tickets
  end

  root 'welcome#index'
end
