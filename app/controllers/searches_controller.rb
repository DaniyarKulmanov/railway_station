class SearchesController < ApplicationController
  before_action :search_trains, only: :show

  def show
  end

  def new
    @railway_stations = RailwayStation.all
  end

  private

  def search_trains
    @trains = Search.trains(params[:search][:station_from], params[:search][:station_to])
  end

  def search_params
    params.require(:search).permit(:station_from, :station_to)
  end
end
