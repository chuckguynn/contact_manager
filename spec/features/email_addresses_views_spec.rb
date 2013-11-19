require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "the views for email addresses", :type => :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  describe "when looking at the new email address form" do
    before(:each) do
      visit new_email_address_path(:contact_id => person.id, :contact_type => 'Person')
    end

    it "should show the contact's name in the title" do
      page.should have_selector("h1", :text => "#{person.last_name}, #{person.first_name}")
    end
  end

  describe "when looking at the edit email address form" do
    before(:each) do
      person.email_addresses.create(:address => "doe@john.com")
      visit edit_email_address_path(person.email_addresses.first)
    end

    it "should show the contact's name in the title" do
      page.should have_selector("h1", :text => "#{person.last_name}, #{person.first_name}")
    end
  end

end
