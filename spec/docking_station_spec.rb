require "docking_station"
describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  let(:bike) { double :bike }
  it "Should release working bikes" do
    allow(bike).to receive(:working?).and_return(true)
    allow(bike).to receive(:broken?).and_return(false)
    subject.dock(bike)
    released_bike = subject.release_bike
    expect(released_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :see_bikes }

  it "Should see same bike when docked" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.see_bikes[-1]).to eq bike
  end

  describe '#Initialize' do
    it "Initializes with a variable capacity" do
      station = DockingStation.new(50)
      station.capacity.times {station.dock(Bike.new)}
      expect { station.dock(Bike.new) }.to raise_error("Docking station is full already")
    end

    it "set dock capacity when a new docking station is made" do
      expect(subject.capacity).to eq 20
    end
  end

  describe '#release_bike' do
    it "should release bike from docking station" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "Should raise error if no bike present" do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end
  end

  describe '#dock' do
    it "Cannot dock more bikes than the default capacity in one docking station" do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error("Docking station is full already")
    end

    it "Should dock non bikes" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq subject.see_bikes
    end

    it "Should dock broken bikes" do
      bike = Bike.new
      bike.report_broken
      expect(subject.dock(bike)).to eq subject.see_bikes
    end

    it "Should not release a broken bike" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error("No bikes available, cannot release broken bikes")

    end


    #it "Should report bike as broken when docking a broken bike" do
     #expect { subject.dock(Bike.new.report_broken) }.to raise_error("Bike has been returned broken")
    #end
  end
end
