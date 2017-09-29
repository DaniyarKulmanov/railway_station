class Route < ApplicationRecord
  validates :name, presence: true

  has_many :railway_stations, :trains
end
