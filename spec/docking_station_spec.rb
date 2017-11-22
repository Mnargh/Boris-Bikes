require "./lib/docking_station"
describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "bike is docked" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it "bike is seen" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.see_bike).to eq bike
  end

  it { is_expected.to respond_to :see_bike }

  describe '#release_bike' do
    it "should release" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "Should raise error if no bike present" do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end
  end
end
