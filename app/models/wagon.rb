class Wagon < ApplicationRecord
  belongs_to :train
  before_validation :set_wagon_position

  validates :position, uniqueness:  { scope: :train_id }

  def self.types
    types = {CoupeWagon: 'Купе', EconomWagon: 'Плацкарт', CbWagon: 'СВ', SittingWagon: 'Сидячий'}
    types
  end

  def name
    'Вагон'
  end

  private

  def set_wagon_position
    self.position = train.wagons.maximum(:position).to_i + 1
  end
end
