require 'open-uri'
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

20.times do
  users = User.all
  animals = ['Cow', 'Chicken', 'Pig', 'Sheep', 'Horse', 'Rabbit', 'Dog', 'Goat', 'Duck']
  animal_personality = ['quiet', 'lively']
  animal_origin = ['as a gift from a friend', 'was bought because of the outstanding genetics that it has', 'I got it from a friend that is very experienced in raising healthy animals']
  addresses = [
    "913-14 Jogasawa, Mutsu shi, Aomori ken",
    "507-12 Uchikanna, Chita gun taketoyo cho, Aichi ken",
    "611-3 Nikkocho, Moriguchi shi, Osaka fu",
    "710-16 Miirakumachi fuchinomoto, Goto shi, Nagasaki ken",
    "965-10 Sanjocho, Ashiya shi, Hyogo ken",
    "996-8 Oba, Hitachiomiya shi, Ibaraki ken",
    "814-10 Kuchida, Chita gun taketoyo cho, Aichi ken",
    "58-18 Katsumotocho nakafure, Iki shi, Nagasaki ken",
    "838-14 Kumanogawacho nishi, Shingu shi, Wakayama ken",
    "686-18 Atago hamamachi, Maizuru shi, Kyoto fu",
    "615-20 Sakuramachi, Miyazaki shi, Miyazaki ken",
    "72-12 Takazumi, Iwami gun iwami cho, Tottori ken",
    "704-2 Nakasonecho, Okinawa shi, Okinawa ken",
    "12-13 Ogawa, Tone gun minakami machi, Gumma ken",
    "833-18 Ishidamachi, Nobeoka shi, Miyazaki ken",
    "3-589-7 Kuminoki, Osakasayama shi, Osaka fu",
    "989-8 Tomizawa, Soma shi, Fukushima ken",
    "734-1 Katagihara sugiharacho, Kyoto shi nishikyo ku, Kyoto fu",
    "464-18 Mitsuyamotocho, Nagahama shi, Shiga ken",
    "201-10 Soryocho inakusa, Shobara shi, Hiroshima ken"
  ]
  animal = Animal.new(
    species: animals.sample,
    name: Faker::Name.unique.first_name,
    price: rand(5000..20_000),
    user: users.sample,
    address: addresses.sample
  )
  animal.description = "#{animal.name} is a #{animal_personality.sample} #{animal.species}. This #{animal.species} was born in #{Faker::Address.country} and #{animal_origin.sample}."
  file = URI.open("https://source.unsplash.com/random/?#{animal.species}-animal")
  animal.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  animal.save!
  puts "#{animal.name} [#{animal.species}]  created."
end

20.times do
  first_date = start_date
  last_date = end_date(first_date)
  animal = Animal.all.sample
  renter = User.where.not(id: animal.user).sample
  Booking.create!(
    status: Booking.statuses.keys.sample,
    start_date: first_date,
    end_date: last_date,
    user: renter,
    animal: animal
  )
end

puts "Created #{User.count} users."
puts "Created #{Animal.count} animals."
puts "Created #{Booking.count} bookings."
