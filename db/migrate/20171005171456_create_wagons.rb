class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.string :class
      t.integer :upper_seats
      t.integer :bottom_seats

      t.timestamps
    end
  end
end
