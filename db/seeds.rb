require 'faker'

puts "Generating 2 Users:\n"
2.times do |i|
  puts "\e[0m #{(i + 1).ordinalize} User"
  User.create(email: Faker::Internet.unique.email, password: "password", username: Faker::Internet.unique.username(specifier: 4))
  puts "\e[33m Email:\e[32m #{User.last.email}"
  puts "\e[33m Password:\e[32m password"
  puts "\e[33m Username:\e[32m #{User.last.username}"
end
puts "\e[31mFinished generating Users\e[0m"