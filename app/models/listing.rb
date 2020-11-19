class Listing < ApplicationRecord
  belongs_to :user
  has_one :bookings

  validates :name, :description, :location, :price, :picture, :presence => true
  validates :availability, inclusion: { in: [true, false] }
end
