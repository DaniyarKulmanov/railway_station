class Wagon < ApplicationRecord
  WAGON_TYPE = ['Купе', 'Плацкарт', 'СВ', 'Сидячий'].freeze

  belongs_to :train
  before_validation :set_comfort_level
  after_validation :set_wagon_position

  validates :comfort_level, inclusion: WAGON_TYPE

  private

  def set_comfort_level
    self.comfort_level = 'Купе' if self.instance_of? CoupeWagon
    self.comfort_level = 'Плацкарт' if self.instance_of? EconomWagon
    self.comfort_level = 'СВ' if self.instance_of? CbWagon
    self.comfort_level = 'Сидячий' if self.instance_of? SittingWagon
  end

  def set_wagon_position
     self.position = self.train.wagons.find_index(self) + 1
  end
end
