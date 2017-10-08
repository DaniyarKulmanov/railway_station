class Wagon < ApplicationRecord
  belongs_to :train

  # validates :comfort_level, format: /Купе|Плацкарт/
  # WAGON_TYPE = ['Купе', 'Плацкарт'].freeze
end
