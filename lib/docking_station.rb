require_relative 'bike'
class DockingStation
  attr_reader :see_bike

  def release_bike
    raise("No bikes available") unless @see_bike
    @see_bike
  end

  def dock(bike)
    raise("Docking station is full already") if @see_bike
    @see_bike = bike
  end

end
