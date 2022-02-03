require_relative "journey"

class Oystercard
  attr_reader :balance, :list_of_journeys, :journey_started

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @list_of_journeys = []
    @journey_started = []
  end

  def top_up(value)
    fail 'Maximum balance of #{max_balance} exceeded' unless value + balance <= MAX_BALANCE
    @balance += value
  end

  def in_journey?
    true if @entry_station
  end

  def touch_in(station, class_of_journey = Journey)
    fail 'Card has less than minimum balance' unless balance >= MIN_BALANCE
    current_journey = class_of_journey.new(station, nil)
    p current_journey
    @journey_started << current_journey
    deduct(current_journey.fare)
  end

  def touch_out(station)
    if @journey_started.empty? 
      journey_not_touched_in = class_of_journey.new(nil, station)
      @list_of_journeys << journey_not_touched_in
      deduct(journey_not_touched_in.fare)
    else
      calculate_actual_fare = JOURNEY::PENALTY_FARE - JOURNEY::MIN_FARE
      finished_journey = @journey_started[0]
      @journey_started = []
      finished_journey.finish(finished_journey.entry_station, station, (finished_journey.fare - calculate_actual_fare))
      @list_of_journeys << finished_journey
      deduct(- calculate_actual_fare)
    end
  end

  private

  def deduct(value)
    @balance -= value
  end

end
