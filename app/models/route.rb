class Route < ApplicationRecord
  validates :name, presence: true

  has_many :railway_station
end
