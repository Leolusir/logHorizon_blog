def sign_in(options={})
  visit(user_session_path)
  email = options[:email] || 'person@example.com'
  password = options[:password] || 'password'
  within("#new_user") do
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
  end
  click_button 'Log in'
end

def sign_up(options={})  
  visit('/users/sign_up')
  email = options[:email] || 'person1@example.com'
  password = options[:password] || 'password'
  password_re = options[:password_re] || 'password'
  within("#new_user") do
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    fill_in 'Password confirmation', :with => password_re
  end
  click_button 'Sign up'
end
