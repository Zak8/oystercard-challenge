require 'Oystercard'

describe Oystercard do
   describe '#balance' do
     it 'balance on card should be 0' do
       expect(subject.balance).to eq 0
     end
   end
end
