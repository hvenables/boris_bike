require './lib/bike.rb'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty? || all_broken
    release_working_bike
  end

  def dock(bike)
    fail 'Docking Station is full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def all_broken
    bikes.all?(&:broken?)
  end

  def release_working_bike
    bikes.delete(@bikes.select(&:working?).pop)
  end

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end
end
