require 'spec_helper'

describe Company do
  let(:company) do
    Company.new(name: 'Massive Dynamics')
  end

    it 'is valid' do
    expect(company).to be_valid
  end

    it 'is invalid without a name' do
    company.name = nil
    expect(company).to_not be_valid
  end
end
