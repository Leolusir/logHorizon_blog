require 'rails_helper'

feature 'users' do
  background do
    create(:user, email: 'person@example.com')
  end

  scenario 'sign up with correct email or password' do
    sign_in 
    expect(page).to have_content('successfully.')
  end

  scenario 'sign up with a invalid email' do
    sign_up(email:'person@example')
    expect(page).to have_content('Email is invalid')
  end

  scenario 'sign up with a invalid password' do 
    sign_up(password: 'passwor', password_re: 'passwor')
    expect(page).to have_content('Password is too short (minimum is 8 characters)')
  end

  scenario 'sign up with two password donot match' do
    sign_up(password: 'password', password_re: 'password2')
    expect(page).to have_content('Password confirmation doesn')
  end

  scenario 'log in with correct password' do
    sign_in
    expect(page).to have_content('successfully.')
  end
  
  scenario 'log in with invalid password' do
    sign_in(password:'wrongpass')
    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'log in with a not exist email' do
    sign_in(email: 'personN@example.com')
    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'logoout' do
    sign_in
    click_link 'Log out'
    expect(page).to have_content('successfully.')
  end
end
