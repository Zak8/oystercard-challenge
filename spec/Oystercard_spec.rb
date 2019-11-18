require 'Oystercard'

describe Oystercard do
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

  describe "#deduct" do
    it "should deduct an amount from Oystercard" do
      expect{subject.deduct(1)}.to change{subject.balance}.by -1
    end
  end

  describe '#in_journey?' do
     it "returns true if the oystercard is mid-journey" do
        allow(subject).to receive(:balance) {2}
        subject.touch_in
        is_expected.to be_in_journey
     end

     it 'returns false if the oystercard is not mid-journey' do
        subject.touch_out
        is_expected.not_to be_in_journey
     end
  end

  describe "#touch_in" do
    it "throws an error if balance is < 1 when touching in" do
      allow(subject).to receive(:balance) {0}
      expect {subject.touch_in}.to raise_error("Insufficient funds")
    end

  end

end
