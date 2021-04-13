class Credit
  attr_reader :name
  def initialize(name)
    @name     = name
    @person   = nil
    @amount   = 0
    @interest = 0
    @initial_balance = 0
    @final_balance = 0
  end

  def open_credit(person, amount, interest)
    @person = person
    @amount = amount
    @interest = interest
    "#{@person.name} has #{@amount} galleons available credit with an interest rate of #{@interest}%"
  end

  def cc_spend(person, credit_used)
    @initial_balance += credit_used
    if credit_used > @amount
      "You do not have enough credit available."
    else
      "#{@person.name} has spent #{credit_used} galleons of available credit."
    end
  end

  def cc_pay(person, credit_paid)
    if person.cash < credit_paid
      "You do not have enough cash for that amount."
    else
      @final_balance = @initial_balance - credit_paid
      "#{person.name} paid #{credit_paid} galleons toward his balance of #{@initial_balance} owed. Leaving a credit balance of #{@final_balance}"
    end
  end
end
