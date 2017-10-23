class AddPositionToWagons < ActiveRecord::Migration[5.1]
  def change
    add_column :wagons, :position, :integer
  end
end
