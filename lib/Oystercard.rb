class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_AMOUNT = 1
  attr_accessor :balance

  def initialize
    @balance = 0
    @in_journey = false
    @minimum_amount = MINIMUM_AMOUNT
  end

  def top_up(amount)
    raise "Balance limit is £#{BALANCE_LIMIT}" if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Insufficient funds" if @balance < @minimum_amount
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_AMOUNT)
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end
end
