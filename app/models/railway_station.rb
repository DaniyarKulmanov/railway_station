class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.station_number").uniq }

  validates :title, presence: true

  def update_station_number(route, number)
    route_stations = station_route(route)
    route_stations.update(station_number: number) if route_stations
  end

  def position_in(route)
    station_route(route).try(:station_number)
  end

  def arrival(route, type)
    station_route(route).try(type)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
