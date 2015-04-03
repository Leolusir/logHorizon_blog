require 'rails_helper'

feature 'articles' do
  background do
    create(:user, email: 'person@example.com')
  end

  scenario '#new' do
    sign_in 
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
