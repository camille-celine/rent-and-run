class Listing < ApplicationRecord
  belongs_to :user
  has_one :bookings
  
  validates :name, :description, :location, :price, :availability, :picture, :presence => true
end

