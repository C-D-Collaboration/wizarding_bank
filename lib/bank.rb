class Bank
  attr_reader :name
  def initialize(name)
    @name = name
    @account_balance = 0
    @initial_account = Hash.new
  end

  def add_account(credit_union, person)
    @initial_account[credit_union.name] = person.name
    # @initial_acount[person] = person.name
    # @initial_account << credit_union
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

  def transfer(person, bank, transfer_amount)
    if transfer_amount > @account_balance
      "Insufficient funds."
    elsif @initial_account.empty?
      "#{person.name} does not have an account with #{bank.name}"
    else
      "#{person.name} has transferred #{transfer_amount} galleons from #{@initial_account.keys.first} to #{bank.name}."
    end
  end

  def total_cash
    "Total Cash: #{@account_balance} galleons"
  end
end
