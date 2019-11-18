require 'Oystercard'

describe Oystercard do
   describe '#balance' do
     it 'balance on card should be 0' do
       expect(subject.balance).to eq 0
     end
   end
   describe "#top_up" do
    it "should add 1 to balance" do
        subject.top_up(1)
        expect(subject.balance).to eq 1
    end
    end
end
