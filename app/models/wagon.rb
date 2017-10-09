class Wagon < ApplicationRecord
  WAGON_TYPE = ['Купе', 'Плацкарт'].freeze

  belongs_to :train

  validates :comfort_level, inclusion: WAGON_TYPE
end
