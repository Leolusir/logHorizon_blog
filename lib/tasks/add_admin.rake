namespace :users do
  desc "set admin account"
  task new_admin: :environment do
    User.create(email:'admin@example.com', password: 'password')
  end
end
