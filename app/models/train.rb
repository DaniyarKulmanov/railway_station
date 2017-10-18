class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def wagons_count(type)
    self.wagons.count { |wagon| wagon.type == type }
  end

  def seats_count(type,seat)
     self.wagons.where(type: type).sum(seat)
  end
end
