require 'rspec'
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
end