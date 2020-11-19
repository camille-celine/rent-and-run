class Listing < ApplicationRecord
  belongs_to :user
  has_one :bookings
  has_one_attached :photo

  validates :name, :description, :location, :price, :picture, :presence => true
  validates :availability, inclusion: { in: [true, false] }
end

