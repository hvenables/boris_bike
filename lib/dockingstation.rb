require './lib/bike.rb'

class DockingStation

DEFAULT_CAPACITY = 20

  attr_reader :capacity
  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
  	fail 'No bikes available' if empty?
  	bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= @capacity
  end

end

