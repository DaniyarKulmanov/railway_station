class Ticket < ApplicationRecord
  has_one :train
  # has_one :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  #belongs_to :user
end
