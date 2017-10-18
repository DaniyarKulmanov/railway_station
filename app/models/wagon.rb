class Wagon < ApplicationRecord
  WAGON_TYPE = ['Купе', 'Плацкарт', 'СВ', 'Сидячий'].freeze
  belongs_to :train
  before_validation :set_wagon_position

  validates :position, uniqueness:  { scope: :train_id }

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
     self.position = self.train.wagons.last.position + 1 if self.train
  end
end
