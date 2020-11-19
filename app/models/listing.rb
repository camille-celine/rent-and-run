class Listing < ApplicationRecord
  belongs_to :user
  has_one :bookings

  has_one_attached :photo
end
