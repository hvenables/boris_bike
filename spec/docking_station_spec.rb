require 'dockingstation'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it "release and test if working" do
  	bike = subject.release_bike
  	expect(bike).to be_working
  end
end

