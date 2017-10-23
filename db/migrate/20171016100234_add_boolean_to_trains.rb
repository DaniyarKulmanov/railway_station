class AddBooleanToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :sort_asc, :boolean, default: false
  end
end
