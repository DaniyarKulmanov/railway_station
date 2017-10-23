Rails.application.routes.draw do
  resources :trains, :railway_stations, :routes, :wagons
  resources :coupe_wagons, :econom_wagons, :cb_wagons, :sitting_wagons, controller: 'wagons', type: 'CoupeWagon'

  root 'welcome#index'
end
