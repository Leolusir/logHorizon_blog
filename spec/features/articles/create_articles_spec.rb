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
    # expect(page).to have_content('successfully.')
    visit(new_article_path)
    within("#new_article") do
      fill_in 'Title', :with => 'Test Data Title'
      fill_in 'Tags', :with => 'tags; test'
      fill_in 'Content', :with => 'Hello, world! This line is post by Capybara.'
    end
    click_button 'Create Article'
    expect(page).to have_content('successfully')
  end
end
