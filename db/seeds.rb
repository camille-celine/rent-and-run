require "faker"
require "open-uri"

Booking.destroy_all
Listing.destroy_all
User.destroy_all
p "clean"

locations = ["Brandeburger Tor Berlin", "Checkpoint Charlie Berlin", "Reichstag Berlin", "Neues Museum Berlin", "Berliner Philharmonie", "Potsdamer Platz Berlin", "Alexanderplatz Berlin", "Tiergarten Berlin", "Bellevue Berlin", "Hermannplatz Berlin", "Kotbusser Tor Berlin", "Berlin Hauptbahnhof", "Volkspark Friedrichshain Berlin", "Boxhagener Platz Berlin", "Zionskirchplatz Berlin", "Hasenheide Berlin", "Volkspark am Weinberg Berlin", "Mauerpark Berlin", "Oderbergerstrasse Berlin", "Schillerkiez Berlin", "Strausberger Platz Berlin", "Kaufhaus des Westens Berlin"]
# sports = ["Football", "Basketball", "Tennis", "Baseball", "American football", "Baseball", "Combat sports", "Golf", "Volleyball", "Other"]
sports = ["Tennis", "Basketball"]
adjectives = ["Cool ", "Great ", "Okayish ", "Aerodynamic ", "New ", "Old ", "Usable ", "Used ", "Barely used ", "Slightly used ", "Functioning ", "Vintage ", "Original ", "Pro ", "White ", "Black ", "Light ", "Heavy ", "Incredible ", "Mind Blowing "]
items = ["Gloves", "Shoes", "Balls", "Socks", "Pants", "Shirt", "Shorts", "Racquet", "Jersey", "Clubs", "Shin Guards", "Hat", "Helmet"]

10.times do
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
  rand(1..2).times do
    listing = Listing.create!(
      # name: Faker::Commerce.product_name,
      name: adjectives.sample + items.sample,
      description: Faker::Hipster.unique.sentence,
      location: locations.sample,
      price: rand(1..20),
      category: sports.sample,
      picture: '1',
      availability: [true, false].sample,
      user_id: user.id
    )
    picture = URI.open("https://picsum.photos/300/200")
    listing.photo.attach(io: picture, filename: "#{listing.name}.jpg", content_type: "image/jpg")
    listing.save
  end
end
p "#{Listing.count} were created"
