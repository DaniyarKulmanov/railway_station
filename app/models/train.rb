class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def wagons_count(type)
    self.wagons.count { |wagon| wagon.comfort_level == type }
  end

  def seats_count(type,seat)
    count ||= 0
     self.wagons.each do |wagon|
       count += wagon.upper_seats if wagon.comfort_level == type && seat == :upper
       count += wagon.bottom_seats if wagon.comfort_level == type && seat == :bottom
       count += wagon.side_top_seats if wagon.comfort_level == type && seat == :side_top
       count += wagon.side_bottom_seats if wagon.comfort_level == type && seat == :side_bottom
       count += wagon.sitting_seats if wagon.comfort_level == type && seat == :sitting
     end
     count
  end
end
