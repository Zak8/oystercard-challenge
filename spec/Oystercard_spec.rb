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

<<<<<<< HEAD
=======
  describe "#deduct" do
    it "should deduct an amount from Oystercard" do
      expect{subject.send(:deduct, 1)}.to change{subject.balance}.by -1
    end
  end

>>>>>>> a0afedb669d79b82e82ebde9a10bd6a1d6057fdb
  describe '#in_journey?' do
     it "returns true if the oystercard is mid-journey" do
        subject.top_up(2)
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
      allow(subject).to receive(:balance) { 0 }
      expect{subject.touch_in}.to raise_error("Insufficient funds")
    end
  end

<<<<<<< HEAD
  describe "#touch_out" do
    it "should deduct money when the user touches out." do
      oyster = Oystercard.new
      oyster.top_up(10)
      oyster.touch_in
      oyster.touch_out
      expect{oyster.touch_out}.to change{oyster.balance}.by -1
    end
  end
=======
  describe '#touch_out' do
    it "reduces the balance by the minimum fare when you touch out" do
        subject.top_up(1)
        subject.touch_in
       expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
    end
  end

>>>>>>> a0afedb669d79b82e82ebde9a10bd6a1d6057fdb
end
