namespace :init do
  desc "set admin account"
  task generate_admin: :environment do
    User.create(email:'admin@example.com', password: 'password')
  end
end
