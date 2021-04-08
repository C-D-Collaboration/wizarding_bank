require 'rspec'
require './lib/person'

RSpec.describe Person do 
  it 'can create an instance of a person class' do
    person1 = Person.new("Dani", 10000)
    person2 = Person.new("Chris", 10001)

    expect(person1).to be_instance_of(Person)
    expect(person1.name).to eq("Dani")
    expect(person2.name).to eq("Chris")
    expect(person1.cash).to eq(10000)
    expect(person2.cash).to eq(10001)
  end
end