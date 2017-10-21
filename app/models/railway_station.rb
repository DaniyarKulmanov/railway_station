class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  def update_station_number(route, number)
    route_stations = railway_stations_routes.where(route: route).first
    route_stations.update(station_number: number) if route_stations
  end

end
