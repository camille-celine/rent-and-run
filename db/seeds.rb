# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
# TODO: Write a seed to insert 100 posts in the database

4.times do 
 mark = User.create!(
   name: Faker::FunnyName.name,
   email: Faker::Internet.email,
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
      description: Faker::Hipster.sentence,
      location: Faker::Nation.capital_city,
      price: rand(1..20),
      category: "Tennis",
      user_id: user.id
    )
  end
end
p "#{Listing.count} were created"

p "generating listing.."
User.all.each do |user|
  rand(1..3).times do
    listing_basket = Listing.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Hipster.sentence,
      location: Faker::Nation.capital_city,
      price: rand(1..20),
      category: "Basketball",
      user_id: user.id
    )
  end
end
p "#{Listing.count} were created"

