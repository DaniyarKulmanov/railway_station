class Search

  def self.routes(station_from, station_to) # TODO fix routes array, throwing in the end in view of search/show
    routes = []
    routes_from = Route.joins(:railway_stations).where('railway_stations.id':station_from)
    routes_to = Route.joins(:railway_stations).where('railway_stations.id':station_to)
    routes_from.each do |route_from|
      routes_to.where(id: route_from).each do |route|
        routes << route
      end
    end
    routes
  end
end
