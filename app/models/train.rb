class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def wagons_count(type)
    Wagon.all.where(type: type).count
  end

  def seats_count(type,seat)
     wagons.where(type: type).sum(seat)
  end

  def sorted_wagons
    if sort_asc
      wagons.sort_by {|wagon| wagon.position}
    else
      wagons.reverse {|wagon| wagon.position}
    end
  end
end
