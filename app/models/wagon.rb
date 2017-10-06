class Wagon < ApplicationRecord
  belongs_to :train
  
  validates :comfort_level, format: /Сompartment|Econom/
end
