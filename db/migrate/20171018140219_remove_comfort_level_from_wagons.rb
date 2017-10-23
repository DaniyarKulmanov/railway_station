class RemoveComfortLevelFromWagons < ActiveRecord::Migration[5.1]
  def change
    remove_column :wagons, :comfort_level, :string
  end
end
