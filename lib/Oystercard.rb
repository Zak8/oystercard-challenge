class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false

  end

  def top_up(amount)
    raise "Balance limit is £#{BALANCE_LIMIT}" if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Insufficient funds" if balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
     deduct(MINIMUM_FARE)
     @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
