class Wagon < ApplicationRecord

  validates :comfort_level, format: /Сompartment|Econom/
end
