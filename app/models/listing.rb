class Listing < ApplicationRecord
  belongs_to :user
  has_one :bookings

  validates :name, :description, :location, :price, :availability, :picture, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
