class EconomWagon < Wagon
  validates :upper_seats,:bottom_seats, :side_top_seats, :side_bottom_seats, presence: true

  def name
    'Плацкарт'
  end
end
