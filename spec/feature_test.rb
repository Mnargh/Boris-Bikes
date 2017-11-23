require "./lib/docking_station.rb"
bike1 = Bike.new
bike2 = Bike.new
station = DockingStation.new
p bike1.report_broken
#returns true
p bike1.broken?
#returns true
p station.dock(bike1)
#returns the bike and @broken = true
p station.dock(bike2)
