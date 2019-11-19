class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_AMOUNT = 1
  attr_accessor :balance, :entry_station, :exit_station

  def initialize
    @balance = 0
    @minimum_amount = MINIMUM_AMOUNT
    @entry_station = nil
    @array = []
    @exit_station = nil
  end

  def top_up(amount)
    raise "Balance limit is £#{BALANCE_LIMIT}" if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if balance < MINIMUM_AMOUNT
    @in_journey = true
    @entry_station = entry_station.name
  end

  def touch_out(exit_station)
    @in_journey = false
    deduct(MINIMUM_AMOUNT)
    @exit_station = exit_station.name
    @array.push({entry: @entry_station, exit: @exit_station})
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def Combine_St_In_Out
    hash_of_stations = Hash.new
    hash_of_stations[@entry_station] = @exit_station
  end
end
