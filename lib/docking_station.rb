require_relative 'bike'
class DockingStation
  attr_reader :see_bikes

  def initialize
    @see_bikes = []
  end

  def release_bike
    raise("No bikes available") if @see_bikes.empty?
    @see_bikes.pop
  end

  def dock(bike)
    raise("Docking station is full already") if @see_bikes.count >= 20
    @see_bikes << bike
    bike
  end

end
