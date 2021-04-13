require 'rspec'
require './lib/credit'
require './lib/person'

RSpec.describe Credit do
  it "can create a credit account" do
    amex = Credit.new("AMEX")

    expect(amex).to be_instance_of(Credit)
    expect(amex.name).to eq("AMEX")
  end

  it "can open a line of credit" do
    amex = Credit.new("AMEX")
    chris = Person.new("Chris", 1000)

    expect(amex.open_credit(chris, 100, 0.05)).to eq("Chris has 100 galleons available credit with an interest rate of 0.05%")
  end

  it "can spend against the credit limit" do
    amex = Credit.new("AMEX")
    chris = Person.new("Chris", 1000)
    amex.open_credit(chris, 100, 0.05)

    expect(amex.cc_spend(chris, 50)).to eq("Chris has spent 50 galleons of available credit.")
  end

  it "can not spend more than available credit limit" do
    amex = Credit.new("AMEX")
    chris = Person.new("Chris", 1000)
    amex.open_credit(chris, 100, 0.05)

    expect(amex.cc_spend(chris, 111)).to eq("You do not have enough credit available.")
  end

  it "can pay down credit balance" do
    amex = Credit.new("AMEX")
    chris = Person.new("Chris", 1000)
    amex.open_credit(chris, 100, 0.05)
    amex.cc_spend(chris, 50)

    expect(amex.cc_pay(chris, 25)).to eq("Chris paid 25 galleons toward his balance of 50 owed. Leaving a credit balance of 25")
  end

  it "can not pay down credit balance with more than their cash on hand" do
    amex = Credit.new("AMEX")
    chris = Person.new("Chris", 100)
    amex.open_credit(chris, 150, 0.05)
    amex.cc_spend(chris, 150)

    expect(amex.cc_pay(chris, 150)).to eq("You do not have enough cash for that amount.")
    expect(amex.cc_pay(chris, 100)).to eq("Chris paid 100 galleons toward his balance of 150 owed. Leaving a credit balance of 50")
  end
end
