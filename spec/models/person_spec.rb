require 'spec_helper'

describe Person do
  let(:person) do
    Person.new(first_name: 'Alice', last_name: 'Smith')
  end

  it 'is valid' do
    expect(person).to be_valid
  end

  it 'is invalid without a first name' do
    person.first_name = nil
    expect(person).to_not be_valid
  end

  it 'is invalid without a last name' do
    person.last_name = nil
    expect(person).to_not be_valid
  end

  it 'has an array of phone numbers' do
    expect(person.phone_numbers).to eq([])
  end

  it 'has an array of email addresses' do
    expect(person.email_addresses).to eq([])
  end
end
