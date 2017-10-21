class Wagon < ApplicationRecord
  WAGON_TYPE = [ 'CoupeWagon', 'EconomWagon', 'CbWagon', 'SittingWagon' ].freeze
  belongs_to :train
  before_validation :set_wagon_position

  validates :position, uniqueness:  { scope: :train_id }

  def self.types
    types = {CoupeWagon: 'Купе', EconomWagon: 'Плацкарт', CbWagon: 'СВ', SittingWagon: 'Сидячий'}
    types
  end

  def name
    case self.type
    when 'CoupeWagon' then 'Купе'
    when 'EconomWagon' then 'Плацкарт'
    when 'CbWagon' then 'СВ'
    when 'SittingWagon' then 'Сидячий'
    end
  end

  private

  def set_wagon_position
    self.position = 1 if self.train.wagons.last.nil?
    self.position = self.train.wagons.last.position.to_i + 1 unless self.train.wagons.last.nil?
  end
end
