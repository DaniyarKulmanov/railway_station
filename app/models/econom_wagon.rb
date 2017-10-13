class EconomWagon < CoupeWagon
  validates :side_top_seats, :side_bottom_seats, presence: true
end
