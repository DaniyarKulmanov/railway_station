class Wagon < ApplicationRecord
  WAGON_TYPE = ['Купе', 'Плацкарт', 'СВ', 'Сидячий'].freeze

  belongs_to :train
  before_validation :set_comfort_level

  validates :comfort_level, inclusion: WAGON_TYPE

  private

  def set_comfort_level
    self.comfort_level = 'Купе' if self.instance_of? CoupeWagon
    self.comfort_level = 'Плацкарт' if self.instance_of? EconomWagon
    self.comfort_level = 'СВ' if self.instance_of? CbWagon
  end
end
