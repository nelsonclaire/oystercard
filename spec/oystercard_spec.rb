require 'oystercard.rb'

describe Oystercard do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  # let(:journey) { double :journey }
  # let(:class_of_journey) { double :class_of_journey, new: journey}


  it 'should have a starting balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'should top up balance by value' do
      expect { subject.top_up 2 }.to change { subject.balance }.by 2
    end

    it 'should raise an error if the balance is less than minimum balance' do
      expect { subject.touch_in(entry_station) }.to raise_error('Card has less than minimum balance')
    end

    it 'should raise an error if maximum balance exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up 1 }.to raise_error('Maximum balance of #{max_balance} exceeded')
    end
  end

  describe '#in_journey?' do
      it 'is not on a journey' do
        expect(subject).not_to be_in_journey
      end

    it 'has an empty list of journeys when initialized' do
      expect(subject.list_of_journeys).to be_empty
    end

    # it 'captures the entry station for the journey' do
    #   subject.top_up(Oystercard::MIN_BALANCE)
    #   subject.touch_in(entry_station, class_of_journey)
    #   p subject.journey_started
    #   expect(subject.journey_started).to eq(entry_station)
    # end


    # it 'stores a journey' do
    #   subject.top_up(Oystercard::MIN_BALANCE)
    #   subject.touch_in(entry_station, class_of_journey)
    #   subject.touch_out(exit_station, class_of_journey)
    #   expect(subject.list_of_journeys).to include journey_started
    # end

    # it 'can touch in' do
    #   subject.top_up(Oystercard::MIN_BALANCE)
    #   subject.touch_in(entry_station, class_of_journey)
    #   expect(subject).to be_in_journey
    # end

    # it 'can store the entry station on the card' do
    #   subject.top_up(Oystercard::MIN_BALANCE)
    #   subject.touch_in(entry_station, class_of_journey)
    #   expect(subject.entry_station).to eq entry_station
    # end

    # it 'can touch out' do
    #   subject.top_up(Oystercard::MIN_BALANCE)
    #   subject.touch_in(entry_station, class_of_journey)
    #   subject.touch_out(exit_station)
    #   expect(subject).not_to be_in_journey
    # end

    # it 'can store the exit station on the card' do
    #   subject.top_up(Oystercard::MIN_BALANCE)
    #   subject.touch_in(entry_station)
    #   subject.touch_out(exit_station)
    #   expect(subject.exit_station).to eq exit_station
    # end

  end
end
