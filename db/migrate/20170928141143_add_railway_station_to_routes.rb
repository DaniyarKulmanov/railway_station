class AddRailwayStationToRoutes < ActiveRecord::Migration[5.1]
  def change
    # add_column :trains, current_station_id, :integer
    add_belongs_to :trains, :current_station, index: false
  end
end
