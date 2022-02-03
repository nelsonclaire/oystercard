require_relative '../lib/journey'

describe Journey do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  # it 'has an entry station' do
  #   journey = Journey.new(entry_station)
  #   expect(journey.entry_station).to eq entry_station
  # end

  # it 'at the start there is no exit station' do
  #   journey = Journey.new(entry_station)
  #   expect(journey.exit_station).to eq nil
  # end

  it 'is complete if it has a entry and exit station' do
    journey = Journey.new(entry_station, exit_station)
    expect(journey.complete?).to be true
  end

  it 'is not complete if it does not have an exit station' do
    journey = Journey.new(entry_station)
    expect(journey.complete?).to be false
  end

  it 'should deduct minimum fare when a journey has been completed' do
    journey = Journey.new(entry_station, exit_station)
    expect(journey.fare).to eq Journey::MIN_FARE
    # expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
  end

  it 'should deduct penalty fare when a journey has not been completed' do
    journey = Journey.new(entry_station)
    expect(journey.fare).to eq Journey::PENALTY_FARE
    # expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
  end

end