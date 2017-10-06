class AddWagonsToTrain < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :wagons, :train
  end
end
