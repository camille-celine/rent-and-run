class Listing < ApplicationRecord
  belongs_to :user
  has_one :bookings
end
