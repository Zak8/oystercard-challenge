require 'Oystercard'

describe Oystercard do
  let(:liverpool_stn) { double(:station, name: :liverpool_station) }
  let(:test_oyster) { Oystercard.new }
  # define a double ^^  identifier ^^  receives ^^  returns^^  <<< reference comment

  before(:each) do
    test_oyster.top_up(10)
  end

  describe '#balance' do
    it 'balance on card should be 0' do
      expect(subject.balance).to eq 0
    end
  end

   describe "#top_up" do
    it "should add 1 to balance" do
       expect{ subject.top_up(1) }.to change{ subject.balance }.by 1
    end

    it "should throw and error if the user tries to top up and it exceeds the maximum balance" do
      balance_limit = Oystercard::BALANCE_LIMIT
      subject.top_up(balance_limit)
      expect { subject.top_up(1) }.to raise_error "Balance limit is £#{Oystercard::BALANCE_LIMIT}"
    end
  end

  describe '#in_journey?' do
     it "returns true if the oystercard is mid-journey" do
        test_oyster.top_up(2)
        test_oyster.touch_in(liverpool_stn)
        expect(test_oyster).to be_in_journey
     end

     it 'returns false if the oystercard is not mid-journey' do
        subject.touch_out
        is_expected.not_to be_in_journey
     end
  end

  describe "#touch_in" do
    it "throws an error if balance is < 1 when touching in" do
      allow(subject).to receive(:balance) { 0 }
      expect { subject.touch_in(liverpool_stn) }.to raise_error("Insufficient funds")
    end
  end

  describe "#touch_out" do
    it "should deduct money when the user touches out." do
      test_oyster.touch_in(liverpool_stn)
      test_oyster.touch_out
      expect { test_oyster.touch_out }.to change { test_oyster.balance }.by -1
    end
  end

  it 'saves the entry station on touch-in' do
    test_oyster.touch_in(liverpool_stn)

    expect(test_oyster.entry_station).to eq(:liverpool_station)
  end

  it 'forgets the entry station on touch-out' do
    test_oyster.touch_in(liverpool_stn)
    test_oyster.touch_out

    expect(test_oyster.entry_station).to be_nil
  end
end
