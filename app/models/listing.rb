class Listing < ApplicationRecord
  belongs_to :user
  has_one :bookings

SPORTS = [["Football"], ["Basketball"], ["Tennis"], ["Baseball"], ["American football"], ["Rugby"], ["Combat sports"], ["Volleyball"], ["Golf"], ["Other"]]
end

