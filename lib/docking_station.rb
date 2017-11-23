require_relative 'bike'
class DockingStation
  attr_reader :see_bikes, :capacity

  def initialize(capacity = 20)
    @see_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise("No bikes available") if empty?
    raise("No bikes available, cannot release broken bikes") if @see_bikes[-1].broken? == true
    @see_bikes.pop
  end

  def dock(bike)
    raise("Docking station is full already") if full?
    @see_bikes << bike
  end

private
  def full?
    @see_bikes.count >= @capacity
  end

  def empty?
    @see_bikes.empty?
  end
end
