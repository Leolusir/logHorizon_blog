require 'rails_helper'

feature 'users' do
  background do
    create(:user, email: 'person@example.com')
  end

  scenario '#new' do
    visit('/users/sign_up')
    within("#new_user") do
      fill_in 'Email', :with => 'person1@example.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content('successfully.')
  end

  scenario 'log in' do
    user_log_in
    expect(page).to have_content('successfully.')
  end

  scenario 'logoout' do
    user_log_in
    visit(destroy_user_session_path)
    expect(page).to have_content('successfully.')
  end
  private
  def user_log_in
    visit(user_session_path)
    within("#new_user") do
      fill_in 'Email', :with => 'person@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
  end
end
