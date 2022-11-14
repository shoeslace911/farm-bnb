# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroy"
User.destroy_all
Booking.destroy_all
Animal.destroy_all

puts "Creating seeds"
def start_date
  Faker::Date.between(from "2022-01-01", to: "2022-12-31")
end

def end_date(start_date)
  Faker::Date.between(from "#{start_date}", to: "2022-12-31")
end
10.times do
  User.create({name: Faker::Name.name})
end
10.times do
  Booking.create([{status: :pending, start_date: start_date, end_date: end_date}])
end
10.times do
   Animal.create([{species: Faker::Creature::Animal.name, name: Faker::GreekPhilosophers.name, price: rand(5000..20000)}])
end

puts "Seeded"
