class SittingWagon < Wagon
  validates :sitting_seats, presence: true

  def name
    'Сидячий'
  end
end
