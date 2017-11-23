require_relative 'bike'
class DockingStation
  attr_reader :see_bikes

 DEFAULT_CAPACITY = 20
  def initialize
    @see_bikes = []
  end

  def release_bike
    raise("No bikes available") if empty?
    @see_bikes.pop
  end

  def dock(bike)
    raise("Docking station is full already") if full?
    @see_bikes << bike
  end

private
  def full?
    @see_bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @see_bikes.empty?
  end
end
