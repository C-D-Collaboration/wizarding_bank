class Bank
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def open_account(person)
    "An account has been opened for #{person.name} with #{@name}."
  end

  def deposit(person, amount)
    remainder = person.cash - amount
    if person.cash < amount 
      "#{person.name} does not have enough cash to perform this deposit."
    else
      "#{amount} galleons have been deposited into #{person.name}'s #{@name} account. Balance: #{amount} Cash: #{remainder}"
    end
  end
end