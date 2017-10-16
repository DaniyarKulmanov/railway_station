class AddBooleanToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :sort_asc, :boolean
    add_column :trains, :sort_dsc, :boolean
  end
end
