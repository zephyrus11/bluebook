require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
  
  describe "GET '/login' - from API", :type => :feature do
    it 'shows, Welcome' do
      visit('http://localhost:3000/login')
      expect(page).to have_content("Please fill in your details")
      puts 'New page!'
    end
  end

  feature 'Visitor log in' do
    before :each do
      User.create(email: "user@example.com", password: '1234', username: "user")
    end

  scenario 'with valid email and password' do
   	login_with("user@example.com", "1234")

    expect(page).to have_content('Task')
  end

  scenario 'with invalid email' do
    login_with 'invalid_email', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with blank password' do
    login_with 'valid@example.com', ''

    expect(page).to have_content('Log in')
  end

  def login_with(email, password)
    visit login_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Log in'
  end
end
end