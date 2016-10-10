class Space < ApplicationRecord
  belongs_to :venue
  has_one :address, through: :venue

  has_many :images, as: :imageable
  has_many :bookings
  has_many :working_times
  has_many :prices
  has_many :coupons
  has_many :booking_types, through: :coupons

  enum space_type: [:desk, :prive_office, :meeting_room]
  validates :space_type, presence: true
  validates :size, presence: true
  validates :capicity, presence: true
  validates :quantity, presence: true
end
