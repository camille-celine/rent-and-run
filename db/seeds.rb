require "faker"

Booking.destroy_all
Listing.destroy_all
User.destroy_all
p "clean"

locations = ["Brandeburger Tor", "Checkpoint Charlie", "Reichstag", "Neues Museum", "Berliner Philharmonie", "Potsdamer Platz", "Alexanderplatz", "Tiergarten", "Bellevue", "Hermannplatz", "Kotbusser Tor", "Berlin Hauptbahnhof", "Volkspark Friedrichshain", "Boxhagener Platz", "Zionskirchplatz", "Hasenheide", "Volkspark am Weinberg", "Mauerpark", "Oderbergerstrasse", "Schillerkiez", "Strausberger Platz", "Kaufhaus des Westens"]
sports = ["Football", "Basketball", "Tennis", "Baseball", "American football", "Baseball", "Combat sports", "Golf", "Volleyball", "Other"]


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
      category: sports.sample,
      availability: [true, false].sample,
      picture: "https://picsum.photos/300/200",
      user: user
    )
  end
end

p "#{Listing.count} were created"
