# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New User Page' do
  describe "When I visit 'regirstration/new'" do
    it 'has a form to create a new user' do
      visit '/register/new'

      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
      expect(page).to have_button('Register')
    end

    it 'creates a new user using the new user form' do
      visit '/register/new'

      expect(User.all.count).to eq(0)

      fill_in(:name, with: 'Bob')
      fill_in(:email, with: 'bob@bob.com')
      fill_in(:password, with: 'password')
      fill_in(:password_confirmation, with: 'password')
      click_button('Register')

      expect(current_path).to eq(root_path)

      expect(User.all.count).to eq(1)
    end

    it 'will not allow a duplicate email to be created in the form' do
      user = User.create(name: 'Bob', email:'bob@bob.com', password: 'password')
      visit '/register/new'

      fill_in(:name, with: 'NotBob')
      fill_in(:email, with: 'bob@bob.com')
      fill_in(:password, with: 'password')
      fill_in(:password_confirmation, with: 'password')
      click_button('Register')

      expect(current_path).to eq('/register/new')
      expect(page).to have_content('Email has already been taken')
    end
  end
end
