require 'rails_helper'

feature 'articles' do
  background do
    create(:user, email: 'person@example.com')
  end

  scenario 'created with user logged in and valid infomation' do
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

  scenario 'create failed with user have not logged' do
    sign_in(password:'wrongpass')
    visit(new_article_path)
    expect(page).to have_content('You need to sign in or sign up')
  end

  scenario 'create failed with title length < 5 character' do
    sign_in
    visit(new_article_path)
    within("#new_article") do
      fill_in 'Title', :with => 'Test'
      fill_in 'Tags', :with => 'test; tags'
      fill_in 'Content', :with => 'Hello, world! This line is post by Capybara.'
    end
    click_button 'Create Article'
    expect(page).to have_content('Title is too short')
  end

  scenario 'create failed with content is nil' do
    sign_in
    visit(new_article_path)
    within("#new_article") do
      fill_in 'Title', :with => 'Test is test'
      fill_in 'Tags', :with => 'test; tag'
      fill_in 'Content', :with => ''
    end
    click_button 'Create Article'
    expect(page).to have_content("Content can't be blank")
  end

  scenario 'created tags successfully' do
    sign_in
    visit(new_article_path)
    within("#new_article") do
      fill_in 'Title', :with => 'Test article'
      fill_in 'Tags', :with => 'test; tag'
      fill_in 'Content', :with => 'Here is a content. : )'
    end
    click_button 'Create Article'
    expect(page).to have_selector('a.ui.tag.label', :text => 'test')
  end

end
