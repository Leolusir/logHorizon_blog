require 'rails_helper'

feature 'users' do
  background do
    create(:user, email: 'person@example.com')
  end

  scenario 'sign up with correct email or password' do
    visit('/users/sign_up')
    within("#new_user") do
      fill_in 'Email', :with => 'person1@example.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content('successfully.')
  end

  scenario 'sign up with a invalid email' do
    user_sign_up('person@example', 'password', 'password')
    expect(page).to have_content('Email is invalid')
  end

  scenario 'sign up with a invalid password' do 
    user_sign_up('person1@example.com', 'passwor', 'passwor')
    expect(page).to have_content('Password is too short (minimum is 8 characters)')
  end

  scenario 'sign up with two password donot match' do
    user_sign_up('person1@example.com', 'password', 'password2')
    expect(page).to have_content('Password confirmation doesn')
  end

  scenario 'log in with correct password' do
    user_log_in('person@example.com', 'password')
    expect(page).to have_content('successfully.')
  end
  
  scenario 'log in with invalid password' do
    user_log_in('person@example.com', 'wrongpass')
    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'log in with a not exist email' do
    user_log_in('personN@example.com', 'password')
    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'logoout' do
    user_log_in('person@example.com', 'password')
    click_link 'Log out'
    expect(page).to have_content('successfully.')
  end
  private
  def user_sign_up(email, password, password_re)
    visit('/users/sign_up')
    within("#new_user") do
      fill_in 'Email', :with => email
      fill_in 'Password', :with => password
      fill_in 'Password confirmation', :with => password_re
    end
    click_button 'Sign up'
  end
  def user_log_in(email, password)
    visit(user_session_path)
    within("#new_user") do
      fill_in 'Email', :with => email
      fill_in 'Password', :with => password
    end
    click_button 'Log in'
  end
end
