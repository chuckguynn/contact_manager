require 'spec_helper'

describe EmailAddress do
  let(:email_address) { EmailAddress.new(address: "bob@tester.com")  }

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'is invalid without an email address' do
    email_address.address = nil
    expect(email_address).to_not be_valid
  end
end