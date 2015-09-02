require './lib/bike.rb'

class DockingStation
  def release_bike
  	fail 'No bikes available' unless @bike
  	@bike
  end

  def dock(bike)
  	@bike = bike
  end

end