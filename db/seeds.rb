require 'faker'

User.destroy_all
Part.destroy_all

puts "Generating 2 Users:\n"
2.times do |i|
  puts "\e[0m #{(i + 1).ordinalize} User"
  User.create(email: Faker::Internet.unique.email, password: "password", username: Faker::Internet.unique.username(specifier: 4))
  puts "\e[33m Email:\e[32m #{User.last.email}"
  puts "\e[33m Password:\e[32m password"
  puts "\e[33m Username:\e[32m #{User.last.username}\n"
end
puts "\e[31mFinished generating Users\e[0m\n"

puts "\nGenerating 25 Parts:\n"
25.times do |i|
  puts "\n\e[0m #{(i + 1).ordinalize} Part"
  part = Part.new(part_number: Faker::DrivingLicence.british_driving_licence,
              description: Faker::Appliance.equipment,
              quantity_available: rand(1..250),
              condition: "NE",
              base_price: 15000,
              cost: 13000,
              minimum_order: rand(1..250),
              tag: "MFR 8130/TRACE; STOCK USA **MOQ=10EA**",
              quote_type: "OUTRIGHT SALE")
  puts "\e[33m Part Number:\e[32m #{part.part_number}"
  puts "\e[33m Description:\e[32m #{part.description}"
  part.save
end
puts "\e[31mFinished generating Parts\e[0m"