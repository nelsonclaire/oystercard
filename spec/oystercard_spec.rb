require 'oystercard.rb'

describe Oystercard do
    
    it 'should have a balance of zero' do
        expect(subject.balance).to eq(0)
    end

    describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument }

      it 'should top up balance by value' do
        expect { subject.top_up 2 }.to change { subject.balance }.by(2)
      end
    end

end