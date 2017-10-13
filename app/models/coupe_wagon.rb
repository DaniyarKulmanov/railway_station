class CoupeWagon < Wagon
  validates :upper_seats, :bottom_seats, presence: true
end
