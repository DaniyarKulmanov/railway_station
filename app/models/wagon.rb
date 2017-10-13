class Wagon < ApplicationRecord
  WAGON_TYPE = ['Купе', 'Плацкарт', 'СВ', 'Сидячий'].freeze

  belongs_to :train
  before_validation :set_comfort_level
  before_validation :set_wagon_position

  validates :comfort_level, inclusion: WAGON_TYPE
  validates :position, uniqueness:  { scope: :train_id }

  private

  def set_comfort_level
    self.comfort_level = 'Купе' if self.instance_of? CoupeWagon
    self.comfort_level = 'Плацкарт' if self.instance_of? EconomWagon
    self.comfort_level = 'СВ' if self.instance_of? CbWagon
    self.comfort_level = 'Сидячий' if self.instance_of? SittingWagon
  end

  def set_wagon_position
     self.position = self.train.wagons.size + 1 if self.train
  end
end
