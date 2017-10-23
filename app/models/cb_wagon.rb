class CbWagon < Wagon
  validates :bottom_seats, presence: true

  def name
    'СВ'
  end
end
