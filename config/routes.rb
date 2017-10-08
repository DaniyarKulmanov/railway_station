Rails.application.routes.draw do
  resources :trains, :railway_stations, :routes, :wagons

  root 'welcome#index'
end
