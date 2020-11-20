class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, :description, :location, :price, :presence => true
  validates :availability, inclusion: { in: [true, false] }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
