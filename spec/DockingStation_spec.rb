require 'dockingstation'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  describe "release and test if working" do
  	dockingstation = DockingStation.new
  	bike = dockingstation.release_bike
  	bike_true = bike.working?
  	it { expect(bike_true).to be_truthy }
  end
end

