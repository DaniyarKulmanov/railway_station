Rails.application.routes.draw do
  resources :trains, :railway_stations, :routes

  root 'welcome#index'
end
