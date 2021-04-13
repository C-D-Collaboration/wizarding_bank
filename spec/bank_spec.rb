require 'rspec'
require './lib/person'
require './lib/bank'

RSpec.describe Bank do
  it 'can create an instance of a Bank class' do
    dcu = Bank.new("Dani's Credit Union")

    expect(dcu).to be_instance_of(Bank)
    expect(dcu.name).to eq("Dani's Credit Union")
  end

  it 'can create an account attached to a person' do
    dcu = Bank.new("Dani's Credit Union")
    dani = Person.new("Dani", 1000)

    expect(dcu.open_account(dani)).to eq("An account has been opened for #{dani.name} with #{dcu.name}.")
  end

  it 'can accept deposits and deposit amounts' do
    dcu = Bank.new("Dani's Credit Union")
    dani = Person.new("Dani", 1000)

    expect(dcu.deposit(dani, 750)).to eq("750 galleons have been deposited into #{dani.name}'s #{dcu.name} account. Balance: 750 Cash: 250")
  end

  it 'can not deposit more cash than they have' do
    dcu = Bank.new("Dani's Credit Union")
    dani = Person.new("Dani", 1000)
    dcu.deposit(dani, 5000)
    expect(dcu.deposit(dani, 5000)).to eq("#{dani.name} does not have enough cash to perform this deposit.")
  end

  it "can have withdrawals with a person and amount" do
    dcu = Bank.new("Dani's Credit Union")
    dani = Person.new("Dani", 1000)
    dcu.deposit(dani, 750)

    expect(dcu.withdrawal(dani, 250)).to eq("#{dani.name} has withdrawn 250 galleons. Balance: 500")
  end

  it 'can not withdrawal more cash than they have' do
    dcu = Bank.new("Dani's Credit Union")
    dani = Person.new("Dani", 1000)
    dcu.deposit(dani, 750)

    expect(dcu.withdrawal(dani, 25000)).to eq("Insufficient funds.")
  end

  it "can transfer money to another bank" do
    dcu = Bank.new("Dani's Credit Union")
    ccu = Bank.new("Chris's Credit Union")
    dani = Person.new("Dani", 1000)
    dcu.deposit(dani, 750)
    dcu.add_account(dcu, dani)

    expect(dcu.transfer(dani, ccu, 250)).to eq("#{dani.name} has transferred 250 galleons from #{dcu.name} to #{ccu.name}.")
  end

  it "can't transfer more money than their balance" do
    dani = Person.new("Dani", 1000)
    chris = Person.new("Chris", 1000)
    dcu = Bank.new("Dani's Credit Union")
    ccu = Bank.new("Chris's Credit Union")
    dcu.deposit(dani, 750)
    ccu.deposit(chris, 250)
    dcu.add_account(dcu, dani)
    ccu.add_account(ccu, chris)

    expect(dcu.transfer(dani, ccu, 25000)).to eq("Insufficient funds.")
  end

  it "cannot transfer money to or from a non existing account" do
    dani = Person.new("Dani", 1000)
    dcu = Bank.new("Dani's Credit Union")
    ccu = Bank.new("Chris's Credit Union")
    dcu.deposit(dani, 750)
    # dcu.add_account(dcu)
    expect(dcu.transfer(dani, ccu, 250)).to eq("#{dani.name} does not have an account with #{ccu.name}")
  end

  it "can get current total cash in the bank" do
    dani = Person.new("Dani", 1000)
    dcu = Bank.new("Dani's Credit Union")
    ccu = Bank.new("Chris's Credit Union")
    dcu.deposit(dani, 750)

    expect(dcu.total_cash).to eq("Total Cash: 750 galleons")
  end
end
