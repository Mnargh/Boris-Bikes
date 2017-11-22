require_relative 'bike'
class DockingStation
  attr_reader :see_bike
  def release_bike
    Bike.new
  end

  def dock(bike)
    @see_bike = bike
  end

end
