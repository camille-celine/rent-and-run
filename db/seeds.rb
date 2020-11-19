# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
# TODO: Write a seed to insert 100 posts in the database
Listing.destroy_all
User.destroy_all

locations = ["Brandeburger Tor", "Checkpoint Charlie", "Reichstag", "Neues Museum", "Berliner Philharmonie", "Potsdamer Platz", "Alexanderplatz", "Tiergarten", "Bellevue", "Hermannplatz", "Kotbusser Tor", "Berlin Hauptbahnhof", "Volkspark Friedrichshain", "Boxhagener Platz", "Zionskirchplatz", "Hasenheide", "Volkspark am Weinberg", "Mauerpark", "Oderbergerstrasse", "Schillerkiez", "Strausberger Platz", "Kaufhaus des Westens"]

4.times do
 mark = User.create!(
   name: Faker::FunnyName.unique.name[0..7],
   email: Faker::Internet.unique.email,
   password: "123456",
   img_url: "010101"
 )
 p mark
end

p "generating listing.."
User.all.each do |user|
  rand(1..3).times do
    listing = Listing.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Hipster.unique.sentence,
      location: locations.sample,
      price: rand(1..20),
      category: "Tennis",
      picture: "https://picsum.photos/300/200",
      user: user
    )
  end
end
p "#{Listing.count} were created"

p "generating listing.."
User.all.each do |user|
  rand(1..3).times do
    listing_basket = Listing.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Hipster.unique.sentence,
      location: locations.sample,
      price: rand(1..20),
      category: "Basketball",
      picture: "https://picsum.photos/300/200",
      user: user
    )
  end
end

p "#{Listing.count} were created"

