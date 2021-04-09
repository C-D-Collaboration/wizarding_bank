class Bank
  attr_reader :name
  def initialize(name)
    @name = name
    @account_balance = 0
  end

  def open_account(person)
    "An account has been opened for #{person.name} with #{@name}."
  end

  def deposit(person, amount)
    @account_balance = amount
    remainder = person.cash - amount
    if person.cash < amount
      "#{person.name} does not have enough cash to perform this deposit."
    else
      "#{amount} galleons have been deposited into #{person.name}'s #{@name} account. Balance: #{amount} Cash: #{remainder}"
    end
  end

  def withdrawal(person, withdrawal_amount)
    remainder = @account_balance - withdrawal_amount
    if @account_balance < withdrawal_amount
      "Insufficient funds."
    else
      "#{person.name} has withdrawn #{withdrawal_amount} galleons. Balance: #{remainder}"
    end
  end
end
