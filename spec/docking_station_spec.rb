require 'dockingstation'

describe DockingStation do

  let (:bike) {double('bike', working?: true, broken?: false)}
  let (:bike1) {double 'bike1'}

  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    it 'release and test if working' do
      # allow(bike).to receive(:broken?) {false}
      subject.dock bike
      expect(subject.release_bike).to be_working
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it "Won't release broken bikes when all are broken" do
      bike1 = double :bike, :broken? => true
      subject.dock(bike1)
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'releases only working bike' do
      bike1 = Bike.new
      bike1.report_broken
      bike2 = Bike.new
      bike2.report_broken
      bike3 = Bike.new
      subject.dock(bike1)
      subject.dock(bike2)
      subject.dock(bike3)
      expect(subject.release_bike).to be_working
    end
  end

  describe '#dock' do
    it 'raises error when full' do
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Docking Station is full'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end
