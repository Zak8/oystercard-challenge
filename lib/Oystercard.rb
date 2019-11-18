class Oystercard

  BALANCE_LIMIT = 90

  attr_accessor :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance limit is £#{BALANCE_LIMIT}" if amount + balance > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    if @balance >= 1
      @in_journey = true
    end
    
    if @balance < 1
      raise "Insufficient funds"
    end
      
    
  end

  def touch_out
     @in_journey = false
  end

end
