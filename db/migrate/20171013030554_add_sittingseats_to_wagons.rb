class AddSittingseatsToWagons < ActiveRecord::Migration[5.1]
  def change
    add_column :wagons, :sitting_seats, :integer
  end
end
