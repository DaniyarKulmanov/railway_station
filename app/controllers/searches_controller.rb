class SearchesController < ApplicationController

  def show
  end

  def new
    @trains = Search.trains(params[:station_from], params[:station_to])
  end

  private

  def search_params
    params.require(:search).permit(:station_from, :station_to)
  end

end
