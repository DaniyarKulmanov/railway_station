class AddRailwayStationToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :routes, :railway_station
    add_belongs_to :railway_stations, :route
  end
end
