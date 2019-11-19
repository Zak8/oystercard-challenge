class Oystercard

  BALANCE_LIMIT = 90
<<<<<<< HEAD
  MINIMUM_AMOUNT = 1
  attr_accessor :balance
=======
  MINIMUM_FARE = 1

  attr_reader :balance
>>>>>>> a0afedb669d79b82e82ebde9a10bd6a1d6057fdb

  def initialize
    @balance = 0
    @in_journey = false
<<<<<<< HEAD
    @minimum_amount = MINIMUM_AMOUNT
=======

>>>>>>> a0afedb669d79b82e82ebde9a10bd6a1d6057fdb
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
<<<<<<< HEAD
    @in_journey = false
    deduct(MINIMUM_AMOUNT)
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end
=======
     deduct(MINIMUM_FARE)
     @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end

>>>>>>> a0afedb669d79b82e82ebde9a10bd6a1d6057fdb
end
