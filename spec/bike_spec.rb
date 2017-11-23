require "./lib/bike"
describe Bike do
  it { is_expected.to respond_to :working? }

  it "Bike can be reported broken" do
    subject.report_broken
    expect(subject).to be_broken
  end

end
