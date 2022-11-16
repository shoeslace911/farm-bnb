# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def start_date
  Faker::Date.between(from: '2022-01-01', to: '2022-12-31')
end

def end_date(start_date)
  Faker::Date.between(from: start_date.to_s, to: "2022-12-31")
end

puts "Destroying previous seed for: User, Booking and Animal"
User.destroy_all
# Booking.destroy_all
# Animal.destroy_all

puts "Creating seeds for: User, Booking and Animal"

10.times do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 123456 )
end

10.times do
  users = User.all
  Animal.create!(
    species: Faker::Creature::Animal.name,
    name: Faker::GreekPhilosophers.name,
    price: rand(5000..20_000),
    user: users.sample,
    address: Faker::Address.country
  )
end

10.times do
  first_date = start_date
  last_date = end_date(first_date)
  animal = Animal.all.sample
  renter = User.where.not(id: animal.user).sample
  Booking.create!(
    status: :pending,
    start_date: first_date,
    end_date: last_date,
    user: renter,
    animal: animal
  )
end

puts "Created #{User.count} users."
puts "Created #{Animal.count} animals."
puts "Created #{Booking.count} bookings."
