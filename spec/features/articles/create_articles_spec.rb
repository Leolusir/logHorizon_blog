require 'rails_helper'

feature 'articles' do
  background do
    create(:user, email: 'person@example.com')
  end

  scenario '#new' do
    visit(user_session_path)
    within("#new_user") do
      fill_in 'Email', :with => 'person@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
    expect(page).to have_content('successfully.')
  end
end
