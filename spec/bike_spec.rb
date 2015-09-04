require 'bike'

describe Bike do
  describe '#working?' do
    context 'will respond to working' do
      it { is_expected.to respond_to(:working?) }
    end
  end

  it 'It can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end
end
