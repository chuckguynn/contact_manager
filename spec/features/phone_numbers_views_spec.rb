require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "the views for phone numbers", :type => :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  describe "when looking at the new phone number form" do
    before(:each) do
      visit new_phone_number_path(:contact_id => person.id, :contact_type => 'Person')
    end

    it "should show the contact's name in the title" do
      page.should have_selector("h1", :text => "#{person.last_name}, #{person.first_name}")
    end
  end

  describe "when looking at the edit phone number form" do
    before(:each) do
      person.phone_numbers.create(:number => "719-685-4636")
      visit edit_phone_number_path(person.phone_numbers.first)
    end

    it "should show the contact's name in the title" do
      page.should have_selector("h1", :text => "#{person.last_name}, #{person.first_name}")
    end
  end

end