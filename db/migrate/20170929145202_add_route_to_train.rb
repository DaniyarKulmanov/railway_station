class AddRouteToTrain < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :routes, :train
    add_belongs_to :trains, :route
  end
end
