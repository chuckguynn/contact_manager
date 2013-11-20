require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the company view', type: :feature do

  let(:company) { Fabricate :company }
  let(:user) { company.user }

  describe 'phone numbers' do
    before(:each) do
      company.phone_numbers.create(number: "555-1234")
      login_as(user)
      visit company_path(company)
    end

    it 'shows the phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
    end

    it 'has links to edit phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = company.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_button('Update Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-9191')
      expect(page).to_not have_content(old_number)
    end

    it 'has links to delete phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('delete', href: phone_number_path(phone))
      end
    end

    describe 'email addresses' do
      before(:each) do
        company.email_addresses.create(address: "bob@tester.com")
        company.email_addresses.create(address: "tom@tester.com")
        visit company_path(company)
      end

      it 'shows the email addresses' do
        company.email_addresses.each do |email|
          expect(page).to have_selector('li', text: email.address)
        end
      end

      it 'has an add email address link' do
        expect(page).to have_link('Add email address', href: new_email_address_path(contact_id: company.id, contact_type: 'Company'))
      end

      it 'creates a new email address' do
        first(:link, 'Add email address').click
        page.fill_in('Address', with: 'john@tester.com')
        page.click_button('Create Email address')
        expect(current_path).to eq(company_path(company))
        expect(page).to have_content('john@tester.com')
      end

      it 'has links to edit email addresses' do
        company.email_addresses.each do |email|
          expect(page).to have_link('edit', href: edit_email_address_path(email))
        end
      end

      it 'edits a email address' do
        email = company.email_addresses.first
        old_address = email.address

        first(:link, 'edit').click
        page.fill_in('Address', with: 'test@email.com')
        page.click_button('Update Email address')
        expect(current_path).to eq(company_path(company))
        expect(page).to have_content('test@email.com')
        expect(page).to_not have_content(old_address)
      end

      it 'has links to delete email addresses' do
        company.email_addresses.each do |email|
          expect(page).to have_link('delete', href: email_address_path(email))
        end
      end
    end
  end
end