require 'io/console'
namespace :init do
  desc "set admin account"
  task generate_admin: :environment do
    loop do
      puts "Email:"
      email = STDIN.gets.chomp
      puts "Password:"
      password = STDIN.noecho(&:gets).chomp
      puts "Password confirmation:"
      password_re = STDIN.noecho(&:gets).chomp
      # redo if password != password_re
      if password != password_re
        puts "[error] twice password don't match, please input again"
        redo
      end
      admin = User.create(email: email, password: password)
      break if admin.save
      admin.errors.full_messages.each do |msg|
        puts "[error] #{msg}"
      end
    end
    puts "Account created successfully."
  end
end
