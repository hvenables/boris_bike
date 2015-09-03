require 'dockingstation'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it "release and test if working" do
  	subject.dock Bike.new
  	bike = subject.release_bike
  	expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#release_bike' do
  	it 'raises an error when there are no bikes available' do
  		expect { subject.release_bike }.to raise_error 'No bikes available'
  	end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock(Bike.new)}
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station full'
    end

    it "has a default capacity" do
      docking_station = DockingStation.new
      expect(docking_station.capacity).to eq(20)
    end

    it "Capacity is changable" do
      docking_station = DockingStation.new(50)
      expect(docking_station.capacity).to eq(50)
    end


  end


end

